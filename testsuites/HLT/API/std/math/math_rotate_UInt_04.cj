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
            (rotate(UInt8(128), Int8(-9)), UInt8(64)),
            (rotate(UInt8(0b10000000), Int8(-9)), UInt8(64)),
            (rotate(UInt8(128), Int8(9)), UInt8(1)),
            (rotate(UInt8(0b10000000), Int8(9)), UInt8(1))
        ],
        description: "public func rotate(num: UInt8, d: Int8): UInt8"
    )
    CaseRunner<UInt16>().runCases(
        [
            (rotate(UInt16(32768), Int8(-17)), UInt16(16384)),
            (rotate(UInt16(0b1000000000000000), Int8(-17)), UInt16(16384)),
            (rotate(UInt16(32768), Int8(17)), UInt16(1)),
            (rotate(UInt16(0b1000000000000000), Int8(17)), UInt16(1))
        ],
        description: "public func rotate(num: UInt16, d: Int8): UInt16"
    )
    CaseRunner<UInt32>().runCases(
        [
            (rotate(UInt32(2147483648), Int8(-33)), UInt32(1073741824)),
            (rotate(UInt32(0b10000000000000000000000000000000), Int8(-33)), UInt32(1073741824)),
            (rotate(UInt32(2147483648), Int8(33)), UInt32(1)),
            (rotate(UInt32(0b10000000000000000000000000000000), Int8(33)), UInt32(1))
        ],
        description: "public func rotate(num: UInt32, d: Int8): UInt32"
    )
    var a1: UInt64 = 9223372036854775808
    var a2: UInt64 = 0b1000000000000000000000000000000000000000000000000000000000000000
    CaseRunner<UInt64>().runCases(
        [
            (rotate(a1, Int8(-65)), UInt64(4611686018427387904)),
            (rotate(a2, Int8(-65)), UInt64(4611686018427387904)),
            (rotate(a1, Int8(65)), UInt64(1)),
            (rotate(a2, Int8(65)), UInt64(1))
        ],
        description: "public func rotate(num: UInt64, d: Int8): UInt64"
    )
    return 0
}
