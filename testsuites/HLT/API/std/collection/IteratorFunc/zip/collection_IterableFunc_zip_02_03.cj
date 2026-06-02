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
    var arr101: Array<Array<Int32>> = [[8, 9, 10, 25], [18, 19, 120, 125], [28, 29, 220, 225]]
    var arr102: Array<Array<Int64>> = [[8, 9, 10, 25], [18, 19, 120, 125]]
    var arr103 = Array<String>()
    var arr104 = Array<Array<Rune>>()
    var arr1Expect: Array<(Array<Int32>, Array<Int64>)> = [([8, 9, 10, 25], [8, 9, 10, 25]),
        ([18, 19, 120, 125], [18, 19, 120, 125])]
    var arr2Expect: Array<(Array<Int32>, Array<Int32>)> = [([8, 9, 10, 25], [8, 9, 10, 25]),
        ([18, 19, 120, 125], [18, 19, 120, 125]), ([28, 29, 220, 225], [28, 29, 220, 225])]
    var arr3Expect = Array<(Array<Int32>, String)>()
    var arr4Expect = Array<(Array<Int32>, Array<Rune>)>()
    var arr5Expect = Array<(String, Array<Int32>)>()

    var cases01 = [testIterableZip<Array<Int32>, Array<Int64>>(arr101, arr102, arr1Expect),
        testIterableZip<Array<Int32>, Array<Int32>>(arr101, arr101, arr2Expect),
        testIterableZip<Array<Int32>, String>(arr101, arr103, arr3Expect),
        testIterableZip<String, Array<Int32>>(arr103, arr101, arr5Expect),
        testIterableZip<Array<Int32>, Array<Rune>>(arr101, arr104, arr4Expect)]
    var casesExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != casesExpect) {
        return 1
    }
    return 0
}
