// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../BoxedDecl
// EXEC: %compiler %pkg_opt -g BoxedDecl/src/core %mod_name_opt BoxedDecl -o libcore.%middle %compile_lib_opt
// EXEC: %compiler %pkg_opt -g BoxedDecl/src %mod_name_opt BoxedDecl libcore.%middle
// EXEC: main

internal import std.core.*

main(): Int64 {
    return 0
}
