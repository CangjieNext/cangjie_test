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
    CaseRunner<Float16>().runCases(
        [
            (sin(Float16(-1.57)), Float16(-1), Float16(0.001)),
            (sin(Float16(1.57)), Float16(1), Float16(0.001))
        ],
        description: "public func sin(x: Float16): Float16"
    )
    CaseRunner<Float32>().runCases(
        [
            (sin(Float32(-1.57)), Float32(-1), Float32(0.001)),
            (sin(Float32(1.57)), Float32(1), Float32(0.001))
        ],
        description: "public func sin(x: Float32): Float32"
    )
    CaseRunner<Float64>().runCases(
        [
            (sin(Float64(-1.57)), Float64(-1), Float64(0.001)),
            (sin(Float64(1.57)), Float64(1), Float64(0.001))
        ],
        description: "public func sin(x: Float64): Float64"
    )
    return 0
}
