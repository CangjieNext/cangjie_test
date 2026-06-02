// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE : mylib
// EXEC: %compiler %compile_lib_opt %pkg_opt mylib -o mylib.%middle
// EXEC: %compiler mylib.%middle %n.cj
// ASSERT: regex-not Error

internal import mylib.*

class C <: A {}

class D <: A {}

main(): Int64 {
    return 0
}
