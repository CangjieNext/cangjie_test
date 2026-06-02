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
    var arr1 = Array<Array<Array<Array<Array<Array<Array<Array<Array<Array<Array<Int64>>>>>>>>>>>()
    var arr1Expect = Array<Array<Array<Array<Array<Array<Array<Array<Array<Array<Int64>>>>>>>>>>()
    var mapFunc1 = flatten<Array<Array<Array<Array<Array<Array<Array<Array<Array<Array<Int64>>>>>>>>>>, Array<Array<Array<Array<Array<Array<Array<Array<Array<Int64>>>>>>>>>>(
        arr1)
    var cases01 = testIterableFlattern<Array<Array<Array<Array<Array<Array<Array<Array<Array<Array<Int64>>>>>>>>>>, Array<Array<Array<Array<Array<Array<Array<Array<Array<Int64>>>>>>>>>>(
        arr1, arr1Expect)
    if (cases01 != 0) {
        return 1
    }
    return 0
}
