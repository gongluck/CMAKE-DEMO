# CMake最低版本要求
cmake_minimum_required(VERSION 3.0)

# 获取当前文件夹名
STRING(REGEX REPLACE ".*/(.*)" "\\1" CURRENT_FOLDER ${CMAKE_CURRENT_SOURCE_DIR})

# 项目名称
project(${CURRENT_FOLDER})

# 自动添加当前源码目录和生成目录到包含目录
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# 加入一个配置头文件用于处理CMake对源码的设置
configure_file(
  ${PROJECT_SOURCE_DIR}/config.h.in
  ${PROJECT_BINARY_DIR}/config.h
  )

# 自定义编译选项
option(USESUBMODULE "use submodule" ON)
if (USESUBMODULE)
    # 设置变量
    set(SUBMODULE myfun)
    
    # 添加包含路径
    include_directories(${SUBMODULE})
 
    # 添加子目录
    # 必须放在aux_source_directory前,否则同名变量SRCS会冲突
    add_subdirectory(${SUBMODULE})

    # 设置附加库变量
    set(EXTRA_LIBS ${EXTRA_LIBS} ${SUBMODULE})
endif (USESUBMODULE)

# 查找当前目录下所有源文件并保存到变量
aux_source_directory(. SRCS)

# 指定生成目标
add_executable(${PROJECT_NAME} ${SRCS})

# 添加链接库
target_link_libraries(${PROJECT_NAME} ${EXTRA_LIBS})
