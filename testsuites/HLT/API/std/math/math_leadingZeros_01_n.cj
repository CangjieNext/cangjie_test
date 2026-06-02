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
    CaseRunner<Int64>().runCases(
        [
            (leadingZeros(UInt8(0b00011111)), Int64(3)),
            (leadingZeros(UInt8(31)), Int64(3)),
            (leadingZeros(UInt16(0b0000000000011111)), Int64(11)),
            (leadingZeros(UInt16(31)), Int64(11)),
            (leadingZeros(UInt32(0b00000000000000000000000000011111)), Int64(27)),
            (leadingZeros(UInt32(31)), Int64(27)),
            (leadingZeros(UInt64(0b0000000000000000000000000000000000000000000000000000000000011111)), Int64(59)),
            (leadingZeros(UInt64(31)), Int64(59))
        ],
        description: "连续0"
    )
    CaseRunner<Int64>().runCases(
        [
            (leadingZeros(UInt8(0b01010110)), Int64(1)),
            (leadingZeros(UInt8(86)), Int64(1)),
            (leadingZeros(UInt16(0b0000000001010110)), Int64(9)),
            (leadingZeros(UInt16(86)), Int64(9)),
            (leadingZeros(UInt32(0b00000000000000000000000001010110)), Int64(25)),
            (leadingZeros(UInt32(86)), Int64(25)),
            (leadingZeros(UInt64(0b0000000000000000000000000000000000000000000000000000000001010110)), Int64(57)),
            (leadingZeros(UInt64(86)), Int64(57))
        ],
        description: "不连续0，不在首位,不计算"
    )
    CaseRunner<Int64>().runCases(
        [
            (leadingZeros(UInt8(0b00000000)), Int64(8)),
            (leadingZeros(UInt8(0)), Int64(8)),
            (leadingZeros(UInt16(0b0000000000000000)), Int64(16)),
            (leadingZeros(UInt16(0)), Int64(16)),
            (leadingZeros(UInt32(0b00000000000000000000000000000000)), Int64(32)),
            (leadingZeros(UInt32(0)), Int64(32)),
            (leadingZeros(UInt64(0b0000000000000000000000000000000000000000000000000000000000000000)), Int64(64)),
            (leadingZeros(UInt64(0)), Int64(64))
        ],
        description: "全0"
    )
    var m: UInt64 = 0b1111111111111111111111111111111111111111111111111111111111111111
    var n: UInt64 = 18446744073709551615
    CaseRunner<Int64>().runCases(
        [
            (leadingZeros(UInt8(0b11111111)), Int64(0)),
            (leadingZeros(UInt8(255)), Int64(0)),
            (leadingZeros(UInt16(0b1111111111111111)), Int64(0)),
            (leadingZeros(UInt16(65535)), Int64(0)),
            (leadingZeros(UInt32(0b11111111111111111111111111111111)), Int64(0)),
            (leadingZeros(UInt32(4294967295)), Int64(0)),
            (leadingZeros(m), Int64(0)),
            (leadingZeros(n), Int64(0))
        ],
        description: "全1"
    )
    return 0
}
