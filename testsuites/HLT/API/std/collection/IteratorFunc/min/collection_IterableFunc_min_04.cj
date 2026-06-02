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
    var arr1: Array<UInt32> = [8, 9, 10, 8, 18, 8, 120, 125]
    var arrlist1 = ArrayList<UInt16>([8, 8, 10, 25, 8, 19, 120, 8])
    var set1 = HashSet<Rune>([r'f', r'c', r'a', r'f', r'a', r'a'])

    var cases01 = [testIterableMin<UInt32>(arr1, Option<UInt32>.Some(8)),
        testIterableMin<UInt16>(arrlist1, Option<UInt16>.Some(8)), testIterableMin<Rune>(set1, Option<Rune>.Some(r'a'))]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (resultExpect != cases01) {
        return 1
    }
    return 0
}
