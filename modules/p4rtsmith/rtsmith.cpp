#include "backends/p4tools/modules/p4rtsmith/rtsmith.h"

#include <google/protobuf/text_format.h>

#include <cstdlib>
#include <filesystem>

#include "backends/p4tools/common/compiler/context.h"
#include "backends/p4tools/common/lib/logging.h"
#include "backends/p4tools/modules/p4rtsmith/core/target.h"
#include "backends/p4tools/modules/p4rtsmith/core/util.h"
#include "backends/p4tools/modules/p4rtsmith/register.h"
#include "backends/p4tools/modules/p4rtsmith/toolname.h"
#include "control-plane/p4RuntimeSerializer.h"
#include "lib/error.h"
#include "lib/nullstream.h"

namespace P4Tools::RTSmith {

void RtSmith::registerTarget() {
    // Register all available compiler targets.
    // These are discovered by CMAKE, which fills out the register.h.in file.
    registerRtSmithTargets();
}

int RtSmith::mainImpl(const CompilerResult &compilerResult) {
    // Register all available P4RuntimeSmith targets.
    // These are discovered by CMAKE, which fills out the register.h.in file.
    registerRtSmithTargets();

    enableInformationLogging();

    const auto *programInfo = RtSmithTarget::produceProgramInfo(compilerResult);
    if (programInfo == nullptr) {
        ::error("Program not supported by target device and architecture.");
        return EXIT_FAILURE;
    }
    if (::errorCount() > 0) {
        ::error("P4RuntimeSmith: Encountered errors during preprocessing. Exiting");
        return EXIT_FAILURE;
    }

    auto p4RuntimeApi = programInfo->getP4RuntimeApi();
    printInfo("Inferred API:\n%1%", p4RuntimeApi.p4Info->DebugString());

    auto &fuzzer = RtSmithTarget::getFuzzer(*programInfo);
    const auto &rtsmithOptions = RtSmithOptions::get();

    auto initialConfig = fuzzer.produceInitialConfig();
    auto timeSeriesUpdates = fuzzer.produceUpdateTimeSeries();

    if (rtsmithOptions.getConfigFilePath().has_value() &&
        rtsmithOptions.getOutputDir().has_value()) {
        auto dirPath = rtsmithOptions.getOutputDir().value();
        auto fileName = rtsmithOptions.getConfigFilePath().value();

        if (!(std::filesystem::exists(dirPath) && std::filesystem::is_directory(dirPath))) {
            if (!std::filesystem::create_directory(dirPath)) {
                ::error("P4RuntimeSmith: Failed to create output directory. Exiting");
                return EXIT_FAILURE;
            }
        }

        auto fullFilePath = (dirPath / fileName).generic_string();
        auto *outputFile = openFile(fullFilePath, true);
        if (outputFile == nullptr) {
            ::error("P4RuntimeSmith: Config file path doesn't exist. Exiting");
            return EXIT_FAILURE;
        }

        for (const auto &writeRequest : initialConfig) {
            std::string output;
            google::protobuf::TextFormat::Printer textPrinter;
            textPrinter.SetExpandAny(true);
            if (!textPrinter.PrintToString(writeRequest, &output)) {
                ::error(ErrorType::ERR_IO, "Failed to serialize protobuf message to text");
                return false;
            }

            *outputFile << output;
            if (!outputFile->good()) {
                ::error(ErrorType::ERR_IO, "Failed to write text protobuf message to the output");
                return false;
            }

            outputFile->flush();
        }
    }

    if (rtsmithOptions.printToStdout()) {
        printInfo("Generated initial configuration:");
        for (const auto &writeRequest : initialConfig) {
            printInfo("%1%", writeRequest.DebugString());
        }

        printInfo("Time series updates:");
        for (const auto &[time, writeRequest] : timeSeriesUpdates) {
            printInfo("Time %1%:\n%2%", writeRequest.DebugString());
        }
    }

    return ::errorCount() == 0 ? EXIT_SUCCESS : EXIT_FAILURE;
}

std::optional<RtSmithResult> generateConfigImpl(
    std::optional<std::reference_wrapper<const std::string>> program,
    const CompilerOptions &compilerOptions, const RtSmithOptions & /*rtSmithOptions*/) {
    // Register supported P4RTSmith targets.
    registerRtSmithTargets();

    P4Tools::Target::init(compilerOptions.target.c_str(), compilerOptions.arch.c_str());

    // Set up the compilation context.
    auto *compileContext = new CompileContext<CompilerOptions>();
    compileContext->options() = compilerOptions;
    AutoCompileContext autoContext(compileContext);

    CompilerResultOrError compilerResult;
    if (program.has_value()) {
        // Run the compiler to get an IR and invoke the tool.
        ASSIGN_OR_RETURN(compilerResult,
                         P4Tools::CompilerTarget::runCompiler(TOOL_NAME, program.value().get()),
                         std::nullopt);
    } else {
        RETURN_IF_FALSE_WITH_MESSAGE(!compilerOptions.file.isNullOrEmpty(), std::nullopt,
                                     ::error("Expected a file input."));
        // Run the compiler to get an IR and invoke the tool.
        ASSIGN_OR_RETURN(compilerResult, P4Tools::CompilerTarget::runCompiler(TOOL_NAME),
                         std::nullopt);
    }

    const auto *programInfo = RtSmithTarget::produceProgramInfo(compilerResult.value());
    if (programInfo == nullptr || ::errorCount() > 0) {
        ::error("P4RTSmith encountered errors during preprocessing.");
        return std::nullopt;
    }

    auto p4RuntimeApi = programInfo->getP4RuntimeApi();
    printInfo("Inferred API:\n%1%", p4RuntimeApi.p4Info->DebugString());

    auto &fuzzer = RtSmithTarget::getFuzzer(*programInfo);

    auto initialConfig = fuzzer.produceInitialConfig();
    printInfo("Generated initial configuration:");
    for (const auto &writeRequest : initialConfig) {
        printInfo("%1%", writeRequest.DebugString());
    }

    auto timeSeriesUpdates = fuzzer.produceUpdateTimeSeries();
    printInfo("Time series updates:");
    for (const auto &[time, writeRequest] : timeSeriesUpdates) {
        printInfo("Time %1%:\n%2%", writeRequest.DebugString());
    }
    return {{initialConfig, timeSeriesUpdates}};
}

std::optional<RtSmithResult> RtSmith::generateConfig(const std::string &program,
                                                     const CompilerOptions &compilerOptions,
                                                     const RtSmithOptions &rtSmithOptions) {
    try {
        return generateConfigImpl(program, compilerOptions, rtSmithOptions);
    } catch (const std::exception &e) {
        std::cerr << "Internal error: " << e.what() << "\n";
        return std::nullopt;
    } catch (...) {
        return std::nullopt;
    }
    return std::nullopt;
}

std::optional<RtSmithResult> RtSmith::generateConfig(const CompilerOptions &compilerOptions,
                                                     const RtSmithOptions &rtSmithOptions) {
    try {
        return generateConfigImpl(std::nullopt, compilerOptions, rtSmithOptions);
    } catch (const std::exception &e) {
        std::cerr << "Internal error: " << e.what() << "\n";
        return std::nullopt;
    } catch (...) {
        return std::nullopt;
    }
    return std::nullopt;
}

}  // namespace P4Tools::RTSmith
