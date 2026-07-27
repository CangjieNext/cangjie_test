/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms

import std.collection.*
import std.time.*
main() : Unit {
    var startTime = DateTime.now()
    let arr : Array<Byte> = Array<Byte>(1000000, repeat: UInt8(UInt32(r'a')))
    let largeString = String.fromUtf8(arr)
    var subStrings = ArrayList<String>()

    for(i in 0 .. largeString.size where i + 10 < largeString.size) {
        subStrings.add(largeString[i.. i + 10])
    }

    var endTime = DateTime.now()
    println("LargeStringAndSubstrings: ms = ${Float64((endTime - startTime).toNanoseconds()) / 1000000.0}")

    println(subStrings.size);

    return 
}