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
            (log2(Float16(0.5)), Float16(-1), Float16(0.001)),
            (log2(Float16(1)), Float16(0), Float16(0.001)),
            (log2(-(-Float16(1))), Float16(0), Float16(0.001)),
            (log2(inf16), inf16, Float16(0.001)),
            (log2(Float16(-0)), -inf16, Float16(0.001)),
            (log2(Float16(0)), -inf16, Float16(0.001))
        ],
        description: "public func log2(x: float16) : float16"
    )
    CaseRunner<Float32>().runCases(
        [
            (log2(Float32(0.5)), Float32(-1), Float32(0.001)),
            (log2(Float32(1)), Float32(0), Float32(0.001)),
            (log2(-(-Float32(1))), Float32(0), Float32(0.001)),
            (log2(inf32), inf32, Float32(0.001)),
            (log2(Float32(-0)), -inf32, Float32(0.001)),
            (log2(Float32(0)), -inf32, Float32(0.001))
        ],
        description: "public func log2(x: float32) : float32"
    )
    CaseRunner<Float64>().runCases(
        [
            (log2(Float64(0.5)), Float64(-1), Float64(0.001)),
            (log2(Float64(1)), Float64(0), Float64(0.001)),
            (log2(-(-Float64(1))), Float64(0), Float64(0.001)),
            (log2(inf64), inf64, Float64(0.001)),
            (log2(Float64(-0)), -inf64, Float64(0.001)),
            (log2(Float64(0)), -inf64, Float64(0.001))
        ],
        description: "public func log2(x: float64) : float64"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            log2(nan16).isNaN(),
            log2(-nan16).isNaN(),
            log2(nan32).isNaN(),
            log2(-nan32).isNaN(),
            log2(nan64).isNaN(),
            log2(-nan64).isNaN()
        ],
        description: "入参是nan"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            log2(Float16(-1)).isNaN(),
            log2(Float32(-1)).isNaN(),
            log2(Float64(-1)).isNaN(),
            log2(-inf16).isNaN(),
            log2(-inf32).isNaN(),
            log2(-inf64).isNaN()
        ],
        description: "入参 < 0"
    )
    return 0
}
