# 多个目录，多个源文件

# CMake 最低版本号要求
cmake_minimum_required(VERSION 3.15)

# 项目信息
project(mydemo003)

# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)

# 添加 myprint 子目录
add_subdirectory(myprint)

# 指定生成目标 
add_executable(mydemo003 main.cc)

# 添加链接库
target_link_libraries(mydemo003 myprint)