/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../DataCustomType.cj concatLogic.cj
// EXEC: %compiler %cmp_opt %f DataCustomType.cj concatLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var map01 = HashMap<Int32, Int64>([(8, 9), (10, 25)])
    var map02 = HashMap<Int32, Int64>([(18, 19), (110, 125)])
    var map01Expect: Array<(Int32, Int64)> = [(18, 19), (110, 125), (8, 9), (10, 25)]
    var map02Expect: Array<(Int32, Int64)> = [(8, 9), (10, 25), (8, 9), (10, 25)]
    var cases01 = [testIterableConcat<Int32, Int64>(map01, map02, map01Expect),
        testIterableConcat<Int32, Int64>(map01, map01, map02Expect)]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        println(cases01)
        return 1
    }
    return 0
}
