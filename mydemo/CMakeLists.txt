# CMake最低版本要求
cmake_minimum_required(VERSION 3.0)

# 获取当前文件夹名
STRING(REGEX REPLACE ".*/(.*)" "\\1" CURRENT_FOLDER ${CMAKE_CURRENT_SOURCE_DIR})

# 项目名称
project(${CURRENT_FOLDER})

# 设置变量
set(SUBMODULE myfun)

# 添加子目录
# 必须放在aux_source_directory前,否则同名变量SRCS会冲突
add_subdirectory(${SUBMODULE})

# 添加包含路径
include_directories(${SUBMODULE})

# 查找当前目录下所有源文件并保存到变量
aux_source_directory(. SRCS)

# 指定生成目标
add_executable(${PROJECT_NAME} ${SRCS})

# 添加链接库
target_link_libraries(${PROJECT_NAME} ${SUBMODULE})