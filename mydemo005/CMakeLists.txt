# 安装和测试

# CMake 最低版本号要求
cmake_minimum_required(VERSION 3.15)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

# 项目信息
project(mydemo005)

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
add_executable(mydemo005 ${DIR_SRCS})
target_link_libraries (mydemo005  ${EXTRA_LIBS})

# 指定安装路径
install (TARGETS mydemo005 DESTINATION bin)
install (FILES "${PROJECT_BINARY_DIR}/config.h"
         DESTINATION include)

# 定义一个宏，用来简化测试工作
macro (do_test mycommand myret)
add_test (test_${mycommand}_${myret} ${mycommand})
set_tests_properties (test_${mycommand}_${myret}
  PROPERTIES PASS_REGULAR_EXPRESSION ${myret})
endmacro (do_test)

# 启用测试
enable_testing()

# 测试程序
do_test(mydemo005 "mydemo")

set(CMAKE_BUILD_TYPE "Debug")
set(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -Wall -g -ggdb")
set(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")