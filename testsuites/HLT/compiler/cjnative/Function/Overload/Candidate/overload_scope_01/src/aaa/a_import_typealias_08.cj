/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/bbb/b_01.cj -o bbb.%middle
// EXEC: %compiler %cmp_opt src/aaa/%f bbb.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package aaa

import bbb.foo

type bbb = TimeUnit

main(): Int64 {
    var a = bbb.foo(1) // type尚不支持构造器和path的替换
    let b: Int64 = match (a) {
        case foo => 1
        case foo(x) => Int64(x)
        case foo(y, z) => y
    }
    return b - 1
}

func foo(x: Int32) {
    return 1
}

func foo(x: Int64) {
    return 2
}

func foo(x: Int64, y: String) {
    return 3
}

func foo(x: Int64, y: Rune) {
    return 4
}

enum TimeUnit {
    foo | foo(Int32) | foo(Int64, String)
}
