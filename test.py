

import shutil
from ply import lex
import numpy as np
import sys
import os
import subprocess
import time

import numpy as np

# 定义 tokens
tokens = [
    'STATEMENT_KEYWORDS',
    'TYPE_MODIFIER_KEYWORDS',
    'OPERATORS',
]

# 定义 token 规则
t_STATEMENT_KEYWORDS = r'for|while|if|else'
t_TYPE_MODIFIER_KEYWORDS = r'struct|union|int|static|const'
t_OPERATORS = r'\+\+|--|!|\|\|>>'

# 定义错误处理函数
def t_error(t):
    t.lexer.skip(1)

# 构建 lexer
lexer = lex.lex()

# 定义 token 提取函数
def extract_tokens(file_name):
    with open(file_name, 'r') as file:
        input_program = file.read()

    lexer.input(input_program)
    token_counts = {
        'STATEMENT_KEYWORDS': 0,
        'TYPE_MODIFIER_KEYWORDS': 0,
        'OPERATORS': 0,
    }

    while True:
        tok = lexer.token()
        if not tok:
            break

        if tok.type == 'STATEMENT_KEYWORDS':
            token_counts['STATEMENT_KEYWORDS'] += 1
        elif tok.type == 'TYPE_MODIFIER_KEYWORDS':
            token_counts['TYPE_MODIFIER_KEYWORDS'] += 1
        elif tok.type == 'OPERATORS':
            token_counts['OPERATORS'] += 1

    return token_counts

def calculate_algebraic_sum(vector_representation):
    return np.sum(np.abs(vector_representation))

# 生成 P4 程序并基于文本向量排序

def generate_and_sort_programs(num_programs, output_folder, output_prefix, p4c_bin, arch):
    os.makedirs(output_folder, exist_ok=True)
    generated_programs = []


    start_time_gen= time.time()

    for i in range(1, num_programs + 1):
        output_file = os.path.join(output_folder, f"{output_prefix}_{i}.p4")
        error_log_file = os.path.join(output_folder, f"{output_prefix}_{i}_error.log")
        command = f"{p4c_bin} --output {output_file} --arch {arch} 2> {error_log_file}"

        # 运行命令并捕获输出
        result = subprocess.run(command, shell=True, capture_output=True, text=True)


        generated_programs.append(f"{output_prefix}_{i}.p4")
    end_time_gen = time.time()
    elapsed_time_gen = end_time_gen - start_time_gen
    print(f"gen_time is {elapsed_time_gen} s")

    # 计算文本向量并排序
    start_time_sort = time.time()
    sorted_programs = calculate_and_sort_vectors(generated_programs, output_folder)
    end_time_sort = time.time()
    elapsed_time_sort = end_time_sort - start_time_sort
    print(f"sort_time is {elapsed_time_sort} s")

    return generated_programs, sorted_programs

def calculate_and_sort_vectors(programs, output_folder):
    vectors = []

    for program in programs:
        output_file = os.path.join(output_folder, program)
        token_counts = extract_tokens(output_file)
        vector_representation = np.array(list(token_counts.values()))
        vectors.append((program, vector_representation))
    #print(f'before the normalized_vectors is {vectors}')

    # 计算每个维度的最小值和最大值
    min_vals = np.min(np.vstack([v[1] for v in vectors]), axis=0)
    max_vals = np.max(np.vstack([v[1] for v in vectors]), axis=0)

    #print(f'min_vals is {min_vals} max_vals is {max_vals}')
    # 对每个维度进行最小最大归一化
    normalized_vectors = [(program, (vector - min_vals) / (max_vals - min_vals)) for program, vector in vectors]
    #print(f'after the normalized_vectors is {normalized_vectors}')

    normalized_vectors.sort(key=lambda x: calculate_algebraic_sum(x[1]), reverse=True)

    sorted_programs = [program for program, _ in normalized_vectors]


    sorted_output_folder = "sorted_output_folder"  # 设置输出文件夹路径
    os.makedirs(sorted_output_folder, exist_ok=True)  # 创建输出文件夹（如果不存在）

    # 构建排序后的文件名与原始文件名的映射关系
    file_mapping = {}
    for i, program in enumerate(sorted_programs, start=1):
        file_mapping[program] = f"sorted_{i}.p4"

    # 遍历原始文件并复制到排序后的文件名
    for program in programs:
        original_file = os.path.join(output_folder, program)
        sorted_file = os.path.join(sorted_output_folder, file_mapping[program])
        shutil.copy(original_file, sorted_file)
    return sorted_programs

# 运行 P4 程序进行 p4test 检查，找到触发 Compiler Bug 的程序
def find_programs_with_bugs(programs, output_folder):
    time.sleep(3)
    programs_with_bugs = []
    start_time_first = time.time()

    for i, program in enumerate(programs, start=1):
        output_file = os.path.join(output_folder, program)
        p4_test_command = f"modules/p4c/build/p4test {output_file}"
        p4_test_result = subprocess.run(p4_test_command, shell=True, capture_output=True, text=True)

        if "Compiler Bug" in p4_test_result.stderr:
            p4c_test_command = f"p4test {output_file}"
            p4c_test_result = subprocess.run(p4c_test_command, shell=True, capture_output=True, text=True)

            if "Compiler Bug" in p4c_test_result.stderr:
                programs_with_bugs.append((i, program))  # 记录程序出现 Compiler Bug 的顺序

    print("\nPrograms with Compiler Bugs (First Run):")
    for order, program in programs_with_bugs:
        print(f"Order: {order}, Program: {program}")

    end_time_first = time.time()
    elapsed_time_first = end_time_first - start_time_first
    print(f"first_time is {elapsed_time_first} s")
    return programs_with_bugs

# 按照排序后的顺序再次运行这 100 个程序，记录触发 Compiler Bug 的次序
def run_sorted_programs_and_report_bugs(sorted_programs, output_folder):
    programs_with_bugs_sorted_order = []
    start_time_second = time.time()

    for i, program in enumerate(sorted_programs, start=1):
        output_file = os.path.join(output_folder, program)

        # Execute p4test command
        p4test_command = f"p4test {output_file}"
        p4test_result = subprocess.run(p4test_command, shell=True, capture_output=True, text=True)

        if "Compiler Bug" in p4test_result.stderr:
            # Execute modules/p4c/build/p4test command
            p4c_test_command = f"modules/p4c/build/p4test {output_file}"
            p4c_test_result = subprocess.run(p4c_test_command, shell=True, capture_output=True, text=True)

            if "Compiler Bug" in p4c_test_result.stderr:
                programs_with_bugs_sorted_order.append(i)  # 记录排序后的程序出现 Compiler Bug 的顺序

    print("\nPrograms with Compiler Bugs (Sorted Order):")
    for order in programs_with_bugs_sorted_order:
        print(f"Order: {order}")
    end_time_second = time.time()
    elapsed_time_second = end_time_second - start_time_second
    print(f"Time elapsed: {elapsed_time_second} s")

    return programs_with_bugs_sorted_order

# 主程序
if __name__ == "__main__":
    #num_programs_to_generate = int(input("Number of P4 programs to generate: "))
    num_programs_to_generate = 10000

    output_folder = "output_folder"
    output_file_prefix = "output"
    p4c_gen_pro_binary_path = "modules/p4c/build/p4bludgeon"
    p4_architecture = "v1model"

    # 生成并排序 P4 程序
    generated_programs, sorted_programs = generate_and_sort_programs(num_programs_to_generate, output_folder, output_file_prefix, p4c_gen_pro_binary_path, p4_architecture)

    # 找到触发 Compiler Bug 的程序（第一次运行）
    programs_with_bugs_first_run = find_programs_with_bugs(generated_programs, output_folder)

    # 按照排序后的顺序再次运行这 100 个程序，记录触发 Compiler Bug 的次序
    programs_with_bugs_sorted_order = run_sorted_programs_and_report_bugs(sorted_programs, output_folder)

    # 进行比较或其他处理...
