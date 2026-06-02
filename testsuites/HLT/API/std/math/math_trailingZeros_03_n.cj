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
    CaseRunner<Int64>().runCases(
        [
            (trailingZeros(Int8(0b01010000)), 4),
            (trailingZeros(80), 4),
            (trailingZeros(Int16(0b0000000001010000)), 4),
            (trailingZeros(Int16(80)), 4),
            (trailingZeros(Int32(0b00000000000000000000000001010000)), 4),
            (trailingZeros(Int32(80)), 4),
            (trailingZeros(Int64(0b0000000000000000000000000000000000000000000000000000000001010000)), 4),
            (trailingZeros(Int64(80)), 4)
        ],
        description: "尾部连续0"
    )
    CaseRunner<Int64>().runCases(
        [
            (trailingZeros(Int8(0b01111011)), 0),
            (trailingZeros(Int8(-5)), 0),
            (trailingZeros(Int16(0b0111111111111011)), 0),
            (trailingZeros(Int16(-5)), 0),
            (trailingZeros(Int32(0b0111111111111111111111111111011)), 0),
            (trailingZeros(Int32(-5)), 0),
            (trailingZeros(Int64(0b0111111111111111111111111111111111111111111111111111111111111011)), 0),
            (trailingZeros(Int64(-5)), 0)
        ],
        description: "尾部不含0"
    )
    CaseRunner<Int64>().runCases(
        [
            (trailingZeros(Int8(0b00000000)), 8),
            (trailingZeros(0), 8),
            (trailingZeros(Int16(0b0000000000000000)), 16),
            (trailingZeros(Int16(0)), 16),
            (trailingZeros(Int32(0b00000000000000000000000000000000)), 32),
            (trailingZeros(Int32(0)), 32),
            (trailingZeros(Int64(0b0000000000000000000000000000000000000000000000000000000000000000)), 64),
            (trailingZeros(Int64(0)), 64)
        ],
        description: "全0"
    )
    CaseRunner<Int64>().runCases(
        [
            (trailingZeros(Int8(-1)), 0),
            (trailingZeros(Int16(-1)), 0),
            (trailingZeros(Int32(-1)), 0),
            (trailingZeros(Int64(-1)), 0)
        ],
        description: "全1"
    )
    return 0
}
