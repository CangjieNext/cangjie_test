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

var a1 = case01()({=> 1})
var a2 = case02()({=> 1})

main(): Int64 {
    if (a1 != 1) {
        return 1
    }
    if (a2 != 2) {
        return 1
    }
    return 0
}

func case01() {
    var a: Int32 = 1
    var foo01 = {x: () -> Int32 => return x()}
    return foo01
}

func case02() {
    let a: Int32 = 1
    var foo02 = {x: () -> Int32 => return x() + a}
    return foo02
}
