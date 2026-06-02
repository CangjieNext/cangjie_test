/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not Exception
import std.math.*

main() {
    var m81: UInt8 = 0b01010110
    var m82: UInt8 = 86
    var n81: UInt16 = 0b0000000001010110
    var n82: UInt16 = 86
    var g81: UInt32 = 0b00000000000000000000000001010110
    var g82: UInt32 = 86
    var f81: UInt64 = 0b00000000000000000000000000000000000000000000000001010110
    var f82: UInt64 = 86
    CaseRunner<Int64>().runCases(
        [
            //不连续多个1
            (countOnes(m81), 4),
            (countOnes(m82), 4),
            (countOnes(n81), 4),
            (countOnes(n82), 4),
            (countOnes(g81), 4),
            (countOnes(g82), 4),
            (countOnes(f81), 4),
            (countOnes(f82), 4)
        ],
        description: "不连续1计算1的个数"
    )

    var m83: UInt8 = 0b00011111
    var m84: UInt8 = 31
    var n83: UInt16 = 0b0000000000011111
    var n84: UInt16 = 31
    var g83: UInt32 = 0b00000000000000000000000000011111
    var g84: UInt32 = 31
    var f83: UInt64 = 0b00000000000000000000000000000000000000000000000000011111
    var f84: UInt64 = 31
    CaseRunner<Int64>().runCases(
        [
            //不连续多个1
            (countOnes(m83), 5),
            (countOnes(m84), 5),
            (countOnes(n83), 5),
            (countOnes(n84), 5),
            (countOnes(g83), 5),
            (countOnes(g84), 5),
            (countOnes(f83), 5),
            (countOnes(f84), 5)
        ],
        description: "连续1计算1的个数"
    )
    var m85: UInt8 = 0b11111111
    var m86: UInt8 = 255
    var n85: UInt16 = 0b1111111111111111
    var n86: UInt16 = 65535
    var g85: UInt32 = 0b11111111111111111111111111111111
    var g86: UInt32 = 4294967295
    var f85: UInt64 = 0b01111111111111111111111111111111111111111111111111111111111111111
    var f86: UInt64 = 18446744073709551615
    CaseRunner<Int64>().runCases(
        [
            //不连续多个1
            (countOnes(m85), 8),
            (countOnes(m86), 8),
            (countOnes(n85), 16),
            (countOnes(n86), 16),
            (countOnes(g85), 32),
            (countOnes(g86), 32),
            (countOnes(f85), 64),
            (countOnes(f86), 64)
        ],
        description: "全1计算1的个数"
    )

    var m87: UInt8 = 0b00000000
    var m88: UInt8 = 0
    var n87: UInt16 = 0b0000000000000000
    var n88: UInt16 = 0
    var g87: UInt32 = 0b00000000000000000000000000000000
    var g88: UInt32 = 0
    var f87: UInt64 = 0b0000000000000000000000000000000000000000000000000000000000000000
    var f88: UInt64 = 0
    CaseRunner<Int64>().runCases(
        [
            (countOnes(m87), 0),
            (countOnes(m88), 0),
            (countOnes(n87), 0),
            (countOnes(n88), 0),
            (countOnes(g87), 0),
            (countOnes(g88), 0),
            (countOnes(f87), 0),
            (countOnes(f88), 0)
        ],
        description: "全0计算1的个数"
    )
    return 0
}
