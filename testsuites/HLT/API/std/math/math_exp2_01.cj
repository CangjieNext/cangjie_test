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
            (exp2(Float16(0.0)), Float16(1), Float16(0.0001)),
            (exp2(Float16(-0.0)), Float16(1), Float16(0.0001)),
            (exp2(Float16(4.0)), Float16(16), Float16(0.0001)),
            (exp2(Float16(-1.0)), Float16(0.5), Float16(0.0001)),
            (exp2(-inf16), Float16(0), Float16(0.0001)),
            (exp2(inf16), inf16, Float16(0.0001))
        ],
        description: "public func exp2(a: float16): float16"
    )
    CaseRunner<Float32>().runCases(
        [
            (exp2(Float32(0)), Float32(1), Float32(0.0001)),
            (exp2(Float32(-0)), Float32(1), Float32(0.0001)),
            (exp2(Float32(4.0)), Float32(16), Float32(0.0001)),
            (exp2(Float32(-1)), Float32(0.5), Float32(0.0001)),
            (exp2(-inf32), Float32(0), Float32(0.0001)),
            (exp2(inf32), inf32, Float32(0.0001))
        ],
        description: "public func exp2(a: float32): float32"
    )
    CaseRunner<Float64>().runCases(
        [
            (exp2(Float64(0)), Float64(1), Float64(0.0001)),
            (exp2(Float64(-0)), Float64(1), Float64(0.0001)),
            (exp2(Float64(4.0)), Float64(16), Float64(0.0001)),
            (exp2(Float64(-1)), Float64(0.5), Float64(0.0001)),
            (exp2(-inf64), Float64(0), Float64(0.0001)),
            (exp2(inf64), inf64, Float64(0.0001))
        ],
        description: "public func exp2(a: float64): float64"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            exp2(nan16).isNaN(),
            exp2(-nan16).isNaN(),
            exp2(nan32).isNaN(),
            exp2(-nan32).isNaN(),
            exp2(nan64).isNaN(),
            exp2(-nan64).isNaN()
        ],
        description: "入参是nan"
    )
    return 0
}
