/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: caserunner.cj
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not Exception

import std.math.*

main() {
    var m81: Int8 = 0b1100100
    var n81: Int16 = 0b111111111110111
    var g81: Int32 = 0b1111110111101111111011111111011
    var f81: Int64 = 0b111111111111111111101111111011111111011111101111110111111101111
    CaseRunner<Int64>().runCases(
        [
            //不连续多个1
            (countOnes(m81), 3),
            (countOnes(n81), 14),
            (countOnes(g81), 27),
            (countOnes(f81), 57)
        ],
        description: "不连续1计算1的个数"
    )
    var m83: Int8 = 0b00011111
    var n83: Int16 = 0b0000000000011111
    var g83: Int32 = 0b00000000000000000000000000011111
    var f83: Int64 = 0b00000000000000000000000000000000000000000000000000011111
    CaseRunner<Int64>().runCases(
        [
            //不连续多个1
            (countOnes(m83), 5),
            (countOnes(n83), 5),
            (countOnes(g83), 5),
            (countOnes(f83), 5)
        ],
        description: "连续1计算1的个数"
    )
    var m85: Int8 = 0b01111111
    var n85: Int16 = 0b0111111111111111
    var g85: Int32 = 0b01111111111111111111111111111111
    var f85: Int64 = 0b0111111111111111111111111111111111111111111111111111111111111111
    CaseRunner<Int64>().runCases(
        [
            //不连续多个1
            (countOnes(m85), 8),
            (countOnes(n85), 16),
            (countOnes(g85), 32),
            (countOnes(f85), 64)
        ],
        description: "正数边界值"
    )
    return 0
}
