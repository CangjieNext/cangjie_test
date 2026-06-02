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
    CaseRunner<Float16>().runCases(
        [
            (exp(Float16(0.0)), Float16(1), Float16(0.0001)),
            (exp(Float16(-0.0)), Float16(1), Float16(0.0001)),
            (exp(Float16(1)), Float16.GetE(), Float16(0.0001)),
            (exp(Float16(-1)), Float16(0.367879), Float16(0.0001)),
            (exp(-inf16), Float16(0), Float16(0.0001)),
            (exp(inf16), inf16, Float16(0.0001))
        ],
        description: "public func exp(a: float16): float16"
    )
    CaseRunner<Float32>().runCases(
        [
            (exp(Float32(0)), Float32(1), Float32(0.0001)),
            (exp(Float32(-0)), Float32(1), Float32(0.0001)),
            (exp(Float32(1)), Float32.GetE(), Float32(0.0001)),
            (exp(Float32(-1)), Float32(0.367879), Float32(0.0001)),
            (exp(-inf32), Float32(0), Float32(0.0001)),
            (exp(inf32), inf32, Float32(0.0001))
        ],
        description: "public func exp(a: float32): float32"
    )
    CaseRunner<Float64>().runCases(
        [
            (exp(Float64(0)), Float64(1), Float64(0.0001)),
            (exp(Float64(-0)), Float64(1), Float64(0.0001)),
            (exp(Float64(1)), Float64.GetE(), Float64(0.0001)),
            (exp(Float64(-1)), Float64(0.367879), Float64(0.0001)),
            (exp(-inf64), Float64(0), Float64(0.0001)),
            (exp(inf64), inf64, Float64(0.0001))
        ],
        description: "public func exp(a: float64): float64"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            exp(nan16).isNaN(),
            exp(-nan16).isNaN(),
            exp(nan32).isNaN(),
            exp(-nan32).isNaN(),
            exp(nan64).isNaN(),
            exp(-nan64).isNaN()
        ],
        description: "入参是nan"
    )
    return 0
}
