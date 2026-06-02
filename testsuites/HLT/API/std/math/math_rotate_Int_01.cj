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
    CaseRunner<Int8>().runCases(
        [
            (rotate(Int8(1), Int8(-1)), Int8(-128)),
            (rotate(Int8(0b00000001), Int8(-1)), Int8(-128)),
            (rotate(Int8(8), Int8(-1)), Int8(4)),
            (rotate(Int8(0b00001000), Int8(-1)), Int8(4))
        ],
        description: "public func rotate(num: Int8, d: Int8): Int8"
    )
    CaseRunner<Int16>().runCases(
        [
            (rotate(Int16(1), Int8(-1)), Int16(-32768)),
            (rotate(Int16(0b0000000000000001), Int8(-1)), Int16(-32768)),
            (rotate(Int16(8), Int8(-1)), Int16(4)),
            (rotate(Int16(0b0000000000001000), Int8(-1)), Int16(4))
        ],
        description: "public func rotate(num: Int16, d: Int8): Int16"
    )
    CaseRunner<Int32>().runCases(
        [
            (rotate(Int32(1), Int8(-1)), Int32(-2147483648)),
            (rotate(Int32(0b00000000000000000000000000000001), Int8(-1)), Int32(-2147483648)),
            (rotate(Int32(8), Int8(-1)), Int32(4)),
            (rotate(Int32(0b00000000000000000000000000001000), Int8(-1)), Int32(4))
        ],
        description: "public func rotate(num: Int32, d: Int8): Int32"
    )
    CaseRunner<Int64>().runCases(
        [
            (rotate(Int64(1), Int8(-1)), Int64(-9223372036854775808)),
            (rotate(Int64(0b0000000000000000000000000000000000000000000000000000000000000001), Int8(-1)), Int64(-9223372036854775808)),
            (rotate(Int64(8), Int8(-1)), Int64(4)),
            (rotate(Int64(0b0000000000000000000000000000000000000000000000000000000000001000), Int8(-1)), Int64(4))
        ],
        description: "public func rotate(num: Int64, d: Int8): Int64"
    )
    return 0
}
