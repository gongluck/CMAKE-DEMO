# 同一目录，多个源文件

# CMake 最低版本号要求
cmake_minimum_required(VERSION 3.15)

# 项目信息
project(mydemo002)

# 指定生成目标
add_executable(mydemo002 main.cc myprint.cc)