/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: caserunner.cj
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not Exception
import std.math.*

main() {
    CaseRunner<Int8>().runCases(
        [
            (rotate(Int8(64), Int8(40)), Int8(64)),
            (rotate(Int8(64), Int8(-40)), Int8(64)),
            (rotate(Int8(64), Int8(-128)), Int8(64)),
            (rotate(Int8(64), Int8(120)), Int8(64)),
            (rotate(Int8(-64), Int8(40)), Int8(-64)),
            (rotate(Int8(-64), Int8(-40)), Int8(-64)),
            (rotate(Int8(-64), Int8(-128)), Int8(-64)),
            (rotate(Int8(-64), Int8(120)), Int8(-64))
        ],
        description: "public func rotate(num: Int8, d: Int8): Int8"
    )
    CaseRunner<Int16>().runCases(
        [
            (rotate(Int16(32367), Int8(16)), Int16(32367)),
            (rotate(Int16(32367), Int8(-16)), Int16(32367)),
            (rotate(Int16(32367), Int8(-128)), Int16(32367)),
            (rotate(Int16(32367), Int8(112)), Int16(32367)),
            (rotate(Int16(-32367), Int8(32)), Int16(-32367)),
            (rotate(Int16(-32367), Int8(-64)), Int16(-32367)),
            (rotate(Int16(-32367), Int8(-128)), Int16(-32367)),
            (rotate(Int16(-32367), Int8(112)), Int16(-32367))
        ],
        description: "public func rotate(num: Int16, d: Int8): Int16"
    )
    CaseRunner<Int32>().runCases(
        [
            (rotate(Int32(1073741824), Int8(32)), Int32(1073741824)),
            (rotate(Int32(1073741824), Int8(-64)), Int32(1073741824)),
            (rotate(Int32(1073741824), Int8(-128)), Int32(1073741824)),
            (rotate(Int32(1073741824), Int8(96)), Int32(1073741824)),
            (rotate(Int32(-1073741824), Int8(32)), Int32(-1073741824)),
            (rotate(Int32(-1073741824), Int8(64)), Int32(-1073741824)),
            (rotate(Int32(-1073741824), Int8(-128)), Int32(-1073741824)),
            (rotate(Int32(-1073741824), Int8(-96)), Int32(-1073741824))
        ],
        description: "public func rotate(num: Int32, d: Int8): Int32"
    )
    CaseRunner<Int64>().runCases(
        [
            (rotate(Int64(4611686018427387904), Int8(64)), Int64(4611686018427387904)),
            (rotate(Int64(4611686018427387904), Int8(-64)), Int64(4611686018427387904)),
            (rotate(Int64(4611686018427387904), Int8(-128)), Int64(4611686018427387904)),
            (rotate(Int64(-4611686018427387904), Int8(-128)), Int64(-4611686018427387904)),
            (rotate(Int64(-4611686018427387904), Int8(-64)), Int64(-4611686018427387904)),
            (rotate(Int64(-4611686018427387904), Int8(64)), Int64(-4611686018427387904))
        ],
        description: "public func rotate(num: Int64, d: Int8): Int64"
    )
    return 0
}
