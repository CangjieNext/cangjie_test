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
    CaseRunner<UInt8>().runCases(
        [
            (rotate(UInt8(0), Int8(-1)), UInt8(0)),
            (rotate(UInt8(0b00000000), Int8(-1)), UInt8(0)),
            (rotate(UInt8(0), Int8(1)), UInt8(0)),
            (rotate(UInt8(0b00000000), Int8(1)), UInt8(0))
        ],
        description: "public func rotate(num: UInt8, d: Int8): UInt8"
    )
    CaseRunner<UInt16>().runCases(
        [
            (rotate(UInt16(0), Int8(-1)), UInt16(0)),
            (rotate(UInt16(0b0000000000000000), Int8(-1)), UInt16(0)),
            (rotate(UInt16(0), Int8(1)), UInt16(0)),
            (rotate(UInt16(0b0000000000000000), Int8(1)), UInt16(0))
        ],
        description: "public func rotate(num: UInt16, d: Int8): UInt16"
    )
    CaseRunner<UInt32>().runCases(
        [
            (rotate(UInt32(0), Int8(-1)), UInt32(0)),
            (rotate(UInt32(0b00000000000000000000000000000000), Int8(-1)), UInt32(0)),
            (rotate(UInt32(0), Int8(1)), UInt32(0)),
            (rotate(UInt32(0b00000000000000000000000000000000), Int8(1)), UInt32(0))
        ],
        description: "public func rotate(num: UInt32, d: Int8): UInt32"
    )
    CaseRunner<UInt64>().runCases(
        [
            (rotate(UInt64(0), Int8(-1)), UInt64(0)),
            (rotate(UInt64(0b0000000000000000000000000000000000000000000000000000000000000000), Int8(-1)), UInt64(0)),
            (rotate(UInt64(0), Int8(1)), UInt64(0)),
            (rotate(UInt64(0b0000000000000000000000000000000000000000000000000000000000000000), Int8(1)), UInt64(0))
        ],
        description: "public func rotate(num: UInt64, d: Int8): UInt64"
    )
    return 0
}
