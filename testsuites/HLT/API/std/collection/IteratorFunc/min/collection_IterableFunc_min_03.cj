/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: minLogic.cj
// EXEC: %compiler %cmp_opt %f  minLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1 = Array<UInt64>()
    var arrlist1 = ArrayList<UInt8>()
    var set1 = HashSet<Rune>()

    var cases01 = [testIterableMin<UInt64>(arr1, Option<UInt64>.None),
        testIterableMin<UInt8>(arrlist1, Option<UInt8>.None), testIterableMin<Rune>(set1, Option<Rune>.None)]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (resultExpect != cases01) {
        return 1
    }
    return 0
}
