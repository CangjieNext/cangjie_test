/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

var r1: ArrayList<String> = ArrayList<String>(3)
var r2: ArrayList<String> = ArrayList<String>(0)
var r3: ArrayList<String> = ArrayList<String>(1000)

func case01() {
    var a = r1.size
    return a
}

func case02() {
    var a = r2.size
    return a
}

func case03() {
    var a = r3.size
    return a
}

main(): Int64 {
    if (case01() != 0) {
        return 1
    }
    if (case02() != 0) {
        return 2
    }
    if (case03() != 0) {
        return 3
    }
    return 0
}
