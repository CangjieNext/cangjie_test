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

var x: Int64 = 2
let y: String = "yz"

func run(): Int64 {
    var res = Foo(1, "x", 3)
    if (res == "1xyzA") {
        return 0
    }
    return 1
}

func Foo(a: Int64, b: String, A: Int64, B!: String = y): String {
    var A1: String = "A"
    return (a).toString() + b + B + A1
}
