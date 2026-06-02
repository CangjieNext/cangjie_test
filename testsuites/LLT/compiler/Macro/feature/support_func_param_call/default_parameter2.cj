// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import define.*

main(): Int64 {
    return run()
}

func run(): Int64 {
    if (Foo() == "good") {
        return 0
    }
    return 1
}

var a: Int32 = 3
var b: Int32 = 4
let score: Int32 = 90

func Foo(
    @M(c!:String = match (score) {
        case 0 => "zero"
        case 90 => "good"
        case _ => "not a valid score"
        }
        )): String {
    return c
}
