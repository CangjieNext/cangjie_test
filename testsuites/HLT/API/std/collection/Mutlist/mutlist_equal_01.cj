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
var r1: ArrayList<String> = ArrayList<String>(list1)
var r2: ArrayList<String> = ArrayList<String>(list1)
var list2: Array<Int8> = [1, 2, 3]
var r3: ArrayList<Int8> = ArrayList<Int8>(list2)
var r4: ArrayList<Int8> = ArrayList<Int8>(list2)

main(): Int64 {
    for (i in 0..r1.size) {
        if (r1[i] == r2[i]) {
            return 0
        }
        if (r3[i] == r4[i]) {
            return 0
        }
    }
    if (r1 == r2) {
        return 0
    }
    if (r1 == r2) {
        return 0
    }
    return 1
}
