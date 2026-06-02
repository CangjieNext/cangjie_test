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
    CaseRunner<Int8>().runCases(
        [
            (rotate(Int8(2), Int8(1)), Int8(4)),
            (rotate(Int8(0b00000010), Int8(1)), Int8(4)),
            (rotate(Int8(64), Int8(1)), Int8(-128)),
            (rotate(Int8(0b01000000), Int8(1)), Int8(-128))
        ],
        description: "public func rotate(num: Int8, d: Int8): Int8"
    )
    CaseRunner<Int16>().runCases(
        [
            (rotate(Int16(2), Int8(1)), Int16(4)),
            (rotate(Int16(0b0000000000000010), Int8(1)), Int16(4)),
            (rotate(Int16(32367), Int8(1)), Int16(-802)),
            (rotate(Int16(0b0111111001101111), Int8(1)), Int16(-802))
        ],
        description: "public func rotate(num: Int16, d: Int8): Int16"
    )
    CaseRunner<Int32>().runCases(
        [
            (rotate(Int32(2), Int8(1)), Int32(4)),
            (rotate(Int32(0b00000000000000000000000000000010), Int8(1)), Int32(4)),
            (rotate(Int32(1073741824), Int8(1)), Int32(-2147483648)),
            (rotate(Int32(0b01000000000000000000000000000000), Int8(1)), Int32(-2147483648))
        ],
        description: "public func rotate(num: Int32, d: Int8): Int32"
    )
    CaseRunner<Int64>().runCases(
        [
            (rotate(Int64(2), Int8(1)), Int64(4)),
            (rotate(Int64(0b0000000000000000000000000000000000000000000000000000000000000010), Int8(1)), Int64(4)),
            (rotate(Int64(4611686018427387904), Int8(1)), Int64(-9223372036854775808)),
            (rotate(Int64(0b0100000000000000000000000000000000000000000000000000000000000000), Int8(1)), Int64(-9223372036854775808))
        ],
        description: "public func rotate(num: Int64, d: Int8): Int64"
    )
    return 0
}
