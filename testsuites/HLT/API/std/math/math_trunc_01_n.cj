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
            (trunc(Float16(-4.9665)), Float16(-4), Float16(0.000)),
            (trunc(Float16(-10.25)), Float16(-10), Float16(0.000)),
            (trunc(Float16(10.25)), Float16(10), Float16(0.000)),
            (trunc(Float16(4.9665)), Float16(4), Float16(0.000)),
            (trunc(Float16(10)), Float16(10), Float16(0.000)),
            (trunc(Float16(-4)), Float16(-4), Float16(0.000)),
            (trunc(Float16(-0)), Float16(0), Float16(0.000)),
            (trunc(Float16(0)), Float16(0), Float16(0.000))
        ],
        description: "public func trunc(x: float16) : float16"
    )
    CaseRunner<Float32>().runCases(
        [
            (trunc(Float32(-4.9665)), Float32(-4), Float32(0.000)),
            (trunc(Float32(-10.25)), Float32(-10), Float32(0.000)),
            (trunc(Float32(10.25)), Float32(10), Float32(0.000)),
            (trunc(Float32(4.9665)), Float32(4), Float32(0.000)),
            (trunc(Float32(10)), Float32(10), Float32(0.000)),
            (trunc(Float32(-4)), Float32(-4), Float32(0.000)),
            (trunc(Float32(-0)), Float32(0), Float32(0.000)),
            (trunc(Float32(0)), Float32(0), Float32(0.000))
        ],
        description: "public func trunc(x: float32) : float32"
    )
    CaseRunner<Float64>().runCases(
        [
            (trunc(Float64(-4.9665)), Float64(-4), Float64(0.000)),
            (trunc(Float64(-10.25)), Float64(-10), Float64(0.000)),
            (trunc(Float64(10.25)), Float64(10), Float64(0.000)),
            (trunc(Float64(4.9665)), Float64(4), Float64(0.000)),
            (trunc(Float64(5)), Float64(5), Float64(0.000)),
            (trunc(Float64(-5)), Float64(-5), Float64(0.000)),
            (trunc(Float64(-0)), Float64(0), Float64(0.000)),
            (trunc(Float64(0)), Float64(0), Float64(0.000))
        ],
        description: "public func trunc(x: float64) : float64"
    )
    return 0
}
