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

main(): Int64 {
    if (case01()({=> 1}) != 2) {
        return 1
    }
    if (case02()({=> 1}) != 4) {
        return 1
    }
    if (case03()({=> 1}) != 2) {
        return 1
    }
    return 0
}

var a: Int32 = 1
var foo01 = {x: () -> Int32 => return x() + a}

func case01() {
    var a: Int32 = 2
    return foo01
}

func case02() {
    let a: Int32 = 3
    return {x: () -> Int32 => return x() + a}
}

func case03() {
    var foo01 = {x: () -> Int32 => return x() + a}
    return foo01
}
