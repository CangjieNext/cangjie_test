/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: stepLogic.cj
// EXEC: %compiler %cmp_opt %f stepLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var arr1: Array<Int32> = [8, 9, 10, 25, 18, 19, 120, 125]
    var arr2 = Array<Int32>()
    var cases = [testIterableStep<Int32>(arr1, arr1.size + 1), testIterableStep<Int32>(arr2, arr2.size + 1),
        testIterableStep<Int32>(arr1, arr1.size), testIterableStep<Int32>(arr1, arr1.size - 3)]
    for (testcase in cases) {
        if (testcase != 0) {
            return 1
        }
    }
    return 0
}
