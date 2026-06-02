// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src
// EXEC: cd ..
// EXEC: %compiler -g %pkg_opt ./src/web %compile_lib_opt -o libweb.%middle
// EXEC: %compiler -g %pkg_opt ./src/controllers %compile_lib_opt -o libcontrollers.%middle
// EXEC: %compiler -g %pkg_opt ./src libweb.%middle libcontrollers.%middle

internal import web.*

main(): Int64 {
    return 0
}
