/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: takeLogic.cj
// EXEC: %compiler %cmp_opt %f takeLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.convert.*
internal import std.collection.*

main(): Int64 {
    var arr1: Array<Int32> = [8, 9, 10, 25, 18, 19, 120, 125]
    var arr2 = Array<Int32>()
    var cases01 = [testIterableTake<Int32>(arr1, 0, arr1.size), testIterableTake<Int32>(arr2, 0, arr2.size),
        testIterableTake<Int32>(arr1, 4, arr1.size), testIterableTake<Int32>(arr2, 4, arr2.size),
        testIterableTake<Int32>(arr1, arr1.size, arr1.size), testIterableTake<Int32>(arr1, arr1.size + 1, arr1.size)]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (resultExpect != cases01) {
        return 1
    }
    return 0
}
