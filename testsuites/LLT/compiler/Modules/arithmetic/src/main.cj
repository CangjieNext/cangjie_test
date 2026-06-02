// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../arithmetic
// EXEC: %compiler %pkg_opt arithmetic/src/arithmetic %compile_lib_opt -o libarithmatic.%middle 
// EXEC: %compiler %pkg_opt arithmetic/src libarithmatic.%middle 
// EXEC-0: %run %run_opt %main

internal import arithmetic.*

main(): Int64 {
    let v = Vector2d(1, -1)
    return add(v.x, v.y)
}
