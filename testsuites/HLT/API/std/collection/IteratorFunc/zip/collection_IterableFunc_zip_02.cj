/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: zipLogic.cj
// EXEC: %compiler %cmp_opt %f zipLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var arr1: Array<Int32> = [8, 9, 10, 25]
    var arr2: Array<Int64> = [18, 19, 120]
    var arr3 = ["18", "19", "120"]
    var arr4 = Array<Int64>()
    var arr5 = Array<String>()

    var arr2Expect: Array<(Int32, Int64)> = [(8, 18), (9, 19), (10, 120)]
    var arr3Expect: Array<(Int64, String)> = [(18, "18"), (19, "19"), (120, "120")]
    var arr4Expect = Array<(Int32, Int64)>()
    var arr5Expect = Array<(Int64, String)>()
    var arr6Expect = Array<(Int64, Int32)>()

    var cases01 = [testIterableZip<Int32, Int64>(arr1, arr2, arr2Expect),
        testIterableZip<Int64, String>(arr2, arr3, arr3Expect), testIterableZip<Int32, Int64>(arr1, arr4, arr4Expect),
        testIterableZip<Int64, Int32>(arr4, arr1, arr6Expect), testIterableZip<Int64, String>(arr4, arr5, arr5Expect)]
    var casesExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != casesExpect) {
        return 1
    }
    return 0
}
