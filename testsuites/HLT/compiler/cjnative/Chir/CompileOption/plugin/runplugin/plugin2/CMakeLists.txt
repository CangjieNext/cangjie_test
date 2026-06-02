# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

cmake_minimum_required(VERSION 3.16.5)
 
# ===== Please name your plugin: (Only need to config this item) =====
# note: all lowercase letters
project(plugin2)
# ====================================================================
 
set(OUTPUT_LIB_NAME ${CMAKE_PROJECT_NAME})
 
include_directories(include)
 
if("$ENV{CANGJIE_HOME}" STREQUAL "")
    message(FATAL_ERROR "\n##### Please confirm cjc is well configured in current environment. #####")
endif()
include_directories($ENV{CANGJIE_HOME}/include)
 
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS OFF)
 
set(DEPENDENCY_LIB_NAME cangjie-lsp)
set(PLUGIN_INSTALL_DIR ${CMAKE_CURRENT_SOURCE_DIR}/output)
add_subdirectory(src)