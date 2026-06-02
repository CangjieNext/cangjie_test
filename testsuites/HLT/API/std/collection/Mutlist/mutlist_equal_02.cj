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

var list1: Array<String> = ["a", "b", "c"]
var list2: Array<String> = ["a", "f", "c"]
var r1: ArrayList<String> = ArrayList<String>(list1)
var r2: ArrayList<String> = ArrayList<String>(list2)
var list3: Array<Int8> = [1, 2, 3]
var list4: Array<Int8> = [2, 2, 3]
var r3: ArrayList<Int8> = ArrayList<Int8>(list3)
var r4: ArrayList<Int8> = ArrayList<Int8>(list4)

main(): Int64 {
    if (r1[1] != r2[1]) {
        return 0
    }
    if (r3[0] != r4[0]) {
        return 0
    }
    if (r1 != r2) {
        return 0
    }
    if (r3 != r4) {
        return 0
    }
    return 1
}
