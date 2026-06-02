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
    CaseRunner<UInt8>().runCases(
        [(reverse(UInt8(80)), UInt8(10))],
        description: "public func reverse(x: UInt8) : UInt8"
    )
    CaseRunner<UInt16>().runCases(
        [(reverse(UInt16(80)), UInt16(2560))],
        description: "public func reverse(x: UInt16) : UInt16"
    )
    CaseRunner<UInt32>().runCases(
        [(reverse(UInt32(80)), UInt32(167772160))],
        description: "public func reverse(x: UInt32) : UInt32"
    )
    CaseRunner<UInt64>().runCases(
        [(reverse(UInt64(80)), UInt64(720575940379279360))],
        description: "public func reverse(x: UInt64) : UInt64"
    )
    return 0
}
