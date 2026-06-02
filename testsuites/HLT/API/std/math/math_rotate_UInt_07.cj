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
            (rotate(UInt8(2), Int8(120)), UInt8(2)),
            (rotate(UInt8(2), Int8(-128)), UInt8(2)),
            (rotate(UInt8(2), Int8(64)), UInt8(2)),
            (rotate(UInt8(2), Int8(-32)), UInt8(2))
        ],
        description: "public func rotate(num: UInt8, d: Int8): UInt8"
    )
    CaseRunner<UInt16>().runCases(
        [
            (rotate(UInt16(2), Int8(112)), UInt16(2)),
            (rotate(UInt16(2), Int8(-128)), UInt16(2)),
            (rotate(UInt16(2), Int8(64)), UInt16(2)),
            (rotate(UInt16(2), Int8(-32)), UInt16(2))
        ],
        description: "public func rotate(num: UInt16, d: Int8): UInt16"
    )
    CaseRunner<UInt32>().runCases(
        [
            (rotate(UInt32(2), Int8(96)), UInt32(2)),
            (rotate(UInt32(2), Int8(-128)), UInt32(2)),
            (rotate(UInt32(2), Int8(64)), UInt32(2)),
            (rotate(UInt32(2), Int8(-64)), UInt32(2))
        ],
        description: "public func rotate(num: UInt32, d: Int8): UInt32"
    )
    CaseRunner<UInt64>().runCases(
        [
            (rotate(UInt64(2), Int8(64)), UInt64(2)),
            (rotate(UInt64(2), Int8(-64)), UInt64(2)),
            (rotate(UInt64(2), Int8(-128)), UInt64(2))
        ],
        description: "public func rotate(num: UInt64, d: Int8): UInt64"
    )
    return 0
}
