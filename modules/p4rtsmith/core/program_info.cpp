#include "backends/p4tools/modules/p4rtsmith/core/program_info.h"

#include "backends/p4tools/common/compiler/compiler_target.h"

namespace P4Tools::RTSmith {

ProgramInfo::ProgramInfo(const CompilerResult &compilerResult, P4::P4RuntimeAPI p4runtimeApi)
    : compilerResult(compilerResult), p4runtimeApi(p4runtimeApi) {}

/* =============================================================================================
 *  Getters
 * ============================================================================================= */

const IR::P4Program *ProgramInfo::getProgram() const { return &compilerResult.get().getProgram(); }

const P4::P4RuntimeAPI &ProgramInfo::getP4RuntimeApi() const { return p4runtimeApi; }

}  // namespace P4Tools::RTSmith
