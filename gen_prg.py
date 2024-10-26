import subprocess
import time

def generate_random_p4_programs(num_programs):
    for i in range(num_programs):
        # 生成唯一的文件名，例如基于当前时间戳
        timestamp = int(time.time())
        output_filename = "out{}_{}.p4".format(i, timestamp)

        # 构建生成 P4 程序的命令
        command = "modules/p4c/build/p4bludgeon --output {} --arch top && modules/p4c/build/p4test {}".format(output_filename, output_filename)

        # 运行命令
        subprocess.run(command, shell=True)

if __name__ == "__main__":
    # 获取用户输入，指定要生成的 P4 程序数量
    num_programs_to_generate = int(input("generate P4 program number: "))

    # 调用函数生成 P4 程序
    generate_random_p4_programs(num_programs_to_generate)
