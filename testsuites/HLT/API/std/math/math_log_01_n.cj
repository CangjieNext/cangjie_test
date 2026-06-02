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
            (log(Float16(2.7182818284)), Float16(1), Float16(0.001)),
            (log(Float16(1)), Float16(0), Float16(0.001)),
            (log(-(-Float16(1))), Float16(0), Float16(0.001)),
            (log(inf16), inf16, Float16(0.001)),
            (log(Float16(0)), -inf16, Float16(0.001)),
            (log(Float16(-0)), -inf16, Float16(0.001))
        ],
        description: "public func log(x: float16) : float16"
    )
    CaseRunner<Float32>().runCases(
        [
            (log(Float32(2.7182818284)), Float32(1), Float32(0.001)),
            (log(Float32(1)), Float32(0), Float32(0.001)),
            (log(-(-Float32(1))), Float32(0), Float32(0.001)),
            (log(inf32), inf32, Float32(0.001)),
            (log(Float32(0)), -inf32, Float32(0.001)),
            (log(Float32(-0)), -inf32, Float32(0.001))
        ],
        description: "public func log(x: float32) : float32"
    )
    CaseRunner<Float64>().runCases(
        [
            (log(Float64(2.7182818284)), Float64(1), Float64(0.001)),
            (log(Float64(1)), Float64(0), Float64(0.001)),
            (log(-(-Float64(1))), Float64(0), Float64(0.001)),
            (log(inf64), inf64, Float64(0.001)),
            (log(Float64(0)), -inf64, Float64(0.001)),
            (log(Float64(-0)), -inf64, Float64(0.001))
        ],
        description: "public func log(x: float64) : float64"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            log(nan16).isNaN(),
            log(-nan16).isNaN(),
            log(nan32).isNaN(),
            log(-nan32).isNaN(),
            log(nan64).isNaN(),
            log(-nan64).isNaN()
        ],
        description: "入参是nan"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            log(Float16(-1)).isNaN(),
            log(Float32(-1)).isNaN(),
            log(Float64(-1)).isNaN(),
            log(-inf16).isNaN(),
            log(-inf32).isNaN(),
            log(-inf64).isNaN()
        ],
        description: "入参 < 0"
    )

    return 0
}
