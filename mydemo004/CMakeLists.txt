# 自定义编译选项

# CMake 最低版本号要求
cmake_minimum_required(VERSION 3.15)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

# 项目信息
project(mydemo004)

# 加入一个配置头文件，用于处理 CMake 对源码的设置
configure_file (
  "${PROJECT_SOURCE_DIR}/config.h.in"
  "${PROJECT_BINARY_DIR}/config.h"
  )

# 自定义编译选项
option (USEMYPRINT "use myprint" ON)
if (USEMYPRINT)
  include_directories ("${PROJECT_SOURCE_DIR}/myprint")
  add_subdirectory (myprint)  
  set (EXTRA_LIBS ${EXTRA_LIBS} myprint)
endif (USEMYPRINT)

# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)

# 指定生成目标
add_executable(mydemo004 ${DIR_SRCS})
target_link_libraries (mydemo004  ${EXTRA_LIBS})