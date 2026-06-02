/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: flattenLogic.cj
// EXEC: %compiler %cmp_opt %f flattenLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var arr1 = ["8", "9", "10", "25"]
    var arr1Expect: Array<Byte> = [56, 57, 49, 48, 50, 53]
    var mapFunc1 = flatten<String, Byte>(arr1)
    var cases01 = testIterableFlattern<String, Byte>(arr1, arr1Expect)
    if (cases01 != 0) {
        return 1
    }
    return 0
}
