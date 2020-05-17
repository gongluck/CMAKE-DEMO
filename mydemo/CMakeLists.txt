# CMake最低版本要求
cmake_minimum_required(VERSION 3.0)

# 项目名称
project(mydemo)

# 查找当前目录下所有源文件并保存到变量
aux_source_directory(. SRCS)

# 指定生成目标
add_executable(mydemo ${SRCS})
