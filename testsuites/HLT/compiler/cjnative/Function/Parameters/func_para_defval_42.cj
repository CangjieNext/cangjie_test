/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    return run()
}

var a: Float64 = 3.14
var b: Float64 = 3.14
var c: Float64 = 3.15

func run(): Int64 {
    var res = Foo()
    if (res == false) {
        return 0
    }
    return 1
}

func Foo(a!: Bool = (a == b) && (a != c) && (a < c) && (a <= c) && (c >= a) && (a > c)): Bool {
    return a
}
