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
            (leadingZeros(Int8(0b00011111)), 3),
            (leadingZeros(31), 3),
            (leadingZeros(Int16(0b0000000000011111)), 11),
            (leadingZeros(Int16(31)), 11),
            (leadingZeros(Int32(0b00000000000000000000000000011111)), 27),
            (leadingZeros(Int32(31)), 27),
            (leadingZeros(Int64(0b0000000000000000000000000000000000000000000000000000000000011111)), 59),
            (leadingZeros(Int64(31)), 59)
        ],
        description: "连续0"
    )
    CaseRunner<Int64>().runCases(
        [
            (leadingZeros(Int8(-5)), 0),
            (leadingZeros(Int16(-5)), 0),
            (leadingZeros(Int32(-5)), 0),
            (leadingZeros(Int64(-5)), 0)
        ],
        description: "不连续0，不在首位"
    )
    CaseRunner<Int64>().runCases(
        [
            (leadingZeros(Int8(0b00000000)), 8),
            (leadingZeros(0), 8),
            (leadingZeros(Int16(0b0000000000000000)), 16),
            (leadingZeros(Int16(0)), 16),
            (leadingZeros(Int32(0b00000000000000000000000000000000)), 32),
            (leadingZeros(Int32(0)), 32),
            (leadingZeros(Int64(0b0000000000000000000000000000000000000000000000000000000000000000)), 64),
            (leadingZeros(Int64(0)), 64)
        ],
        description: "全0"
    )
    CaseRunner<Int64>().runCases(
        [
            (leadingZeros(Int16(-1)), 0),
            (leadingZeros(Int32(-1)), 0),
            (leadingZeros(Int64(-1)), 0)
        ],
        description: "全1"
    )
    return 0
}
