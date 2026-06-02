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
            (trailingZeros(UInt8(0b01010000)), Int64(4)),
            (trailingZeros(UInt8(80)), Int64(4)),
            (trailingZeros(UInt16(0b0000000001010000)), Int64(4)),
            (trailingZeros(UInt16(80)), Int64(4)),
            (trailingZeros(UInt32(0b00000000000000000000000001010000)), Int64(4)),
            (trailingZeros(UInt32(80)), Int64(4)),
            (trailingZeros(UInt64(0b0000000000000000000000000000000000000000000000000000000001010000)), Int64(4)),
            (trailingZeros(UInt64(80)), Int64(4))
        ],
        description: "尾部含0"
    )
    CaseRunner<Int64>().runCases(
        [
            (trailingZeros(UInt8(0b01010111)), Int64(0)),
            (trailingZeros(UInt8(87)), Int64(0)),
            (trailingZeros(UInt16(0b0000000001010111)), Int64(0)),
            (trailingZeros(UInt16(87)), Int64(0)),
            (trailingZeros(UInt32(0b00000000000000000000000001010111)), Int64(0)),
            (trailingZeros(UInt32(87)), Int64(0)),
            (trailingZeros(UInt64(0b0000000000000000000000000000000000000000000000000000000001010111)), Int64(0)),
            (trailingZeros(UInt64(87)), Int64(0))
        ],
        description: "尾部不含0"
    )
    CaseRunner<Int64>().runCases(
        [
            (trailingZeros(UInt8(0b00000000)), Int64(8)),
            (trailingZeros(UInt8(0)), Int64(8)),
            (trailingZeros(UInt16(0b0000000000000000)), Int64(16)),
            (trailingZeros(UInt16(0)), Int64(16)),
            (trailingZeros(UInt32(0b00000000000000000000000000000000)), Int64(32)),
            (trailingZeros(UInt32(0)), Int64(32)),
            (trailingZeros(UInt64(0b0000000000000000000000000000000000000000000000000000000000000000)), Int64(64)),
            (trailingZeros(UInt64(0)), Int64(64))
        ],
        description: "全0"
    )
    var m: UInt64 = 0b1111111111111111111111111111111111111111111111111111111111111111
    var n: UInt64 = 18446744073709551615
    CaseRunner<Int64>().runCases(
        [
            (trailingZeros(UInt8(0b11111111)), Int64(0)),
            (trailingZeros(UInt8(255)), Int64(0)),
            (trailingZeros(UInt16(0b1111111111111111)), Int64(0)),
            (trailingZeros(UInt16(65535)), Int64(0)),
            (trailingZeros(UInt32(0b11111111111111111111111111111111)), Int64(0)),
            (trailingZeros(UInt32(4294967295)), Int64(0)),
            (trailingZeros(m), Int64(0)),
            (trailingZeros(n), Int64(0))
        ],
        description: "全1"
    )
    return 0
}
