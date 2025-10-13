# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

set(CMAKE_BUILD_TYPE "Debug")

file(GLOB PLUGIN_SRC *.cpp)

add_library(${DEPENDENCY_LIB_NAME} SHARED IMPORTED GLOBAL)
file(COPY $ENV{CANGJIE_HOME}/tools/lib/lib${DEPENDENCY_LIB_NAME}.so DESTINATION ${PLUGIN_INSTALL_DIR})
set_target_properties(${DEPENDENCY_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${PLUGIN_INSTALL_DIR}/lib${DEPENDENCY_LIB_NAME}.so)

add_library(${OUTPUT_LIB_NAME} SHARED ${PLUGIN_SRC})
set_target_properties(${OUTPUT_LIB_NAME} PROPERTIES COMPILE_FLAGS "-fPIC")
target_link_libraries(${OUTPUT_LIB_NAME} PRIVATE ${DEPENDENCY_LIB_NAME})

add_custom_command(TARGET ${OUTPUT_LIB_NAME}
        POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E make_directory ${PLUGIN_INSTALL_DIR}
        VERBATIM
        )

set(CMAKE_INSTALL_RPATH "${PLUGIN_INSTALL_DIR}")
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

install(TARGETS ${OUTPUT_LIB_NAME} LIBRARY DESTINATION ${PLUGIN_INSTALL_DIR})
