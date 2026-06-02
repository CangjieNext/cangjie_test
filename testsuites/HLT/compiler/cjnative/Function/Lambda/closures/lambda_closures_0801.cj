/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var a1 = {
    =>
    var a: Int32 = 1
    let b: Int32 = 2
    var x2 = {=> b}
}
var a2 = {
    =>
    var a: Int32 = 1
    let b: Int32 = 2
    var x2 = foo({=> b})
}
var a3 = {
    =>
    var a: Int32 = 1
    let b: Int32 = 2
    if (a == 2) {
        return {=> b}
    } else {
        return foo({=> b})
    }
}

func foo(x: () -> Int32) {
    return x
}

func goo(x: Int32) {
    return x
}

main(): Int64 {
    if (a1() != ()) {
        return 1
    }
    if (a2() != ()) {
        return 1
    }
    if (a3()() != 2) {
        return 1
    }
    return 0
}
