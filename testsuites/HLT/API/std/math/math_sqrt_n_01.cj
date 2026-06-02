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
            (sqrt(Float16(4.0)), Float16(2.0), Float16(0.0001)),
            (sqrt(Float16(0.25)), Float16(0.5), Float16(0.0001)),
            (sqrt(Float16(0)), Float16(0), Float16(0.0001)),
            (sqrt(Float16(-0)), Float16(0), Float16(0.0001))
        ],
        description: "public func sqrt(a: float16): float16"
    )
    CaseRunner<Float32>().runCases(
        [
            (sqrt(Float32(4.0)), Float32(2.0), Float32(0.0001)),
            (sqrt(Float32(0.25)), Float32(0.5), Float32(0.0001)),
            (sqrt(Float32(0)), Float32(0), Float32(0.0001)),
            (sqrt(Float32(-0)), Float32(0), Float32(0.0001))
        ],
        description: "public func sqrt(a: float32): float32"
    )
    CaseRunner<Float64>().runCases(
        [
            (sqrt(Float64(4.0)), Float64(2.0), Float64(0.0001)),
            (sqrt(Float64(0.25)), Float64(0.5), Float64(0.0001)),
            (sqrt(Float64(0)), Float64(0), Float64(0.0001)),
            (sqrt(Float64(-0)), Float64(0), Float64(0.0001))
        ],
        description: "public func sqrt(a: float64): float64"
    )
    return 0
}
