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
            (erf(Float16(-0.52452)), Float16(-0.541992), Float16(0.001)),
            (erf(Float16(0.52452)), Float16(0.541992), Float16(0.001)),
            (erf(Float16(0)), Float16(0), Float16(0.001)),
            (erf(Float16(inf16)), Float16(1), Float16(0.001)),
            (erf(Float16(-inf16)), Float16(-1), Float16(0.001))
        ],
        description: "public func erf(x: float16) : float16"
    )
    CaseRunner<Float32>().runCases(
        [
            (erf(Float32(-0.52452)), Float32(-0.541781), Float32(0.0001)),
            (erf(Float32(0.52452)), Float32(0.541781), Float32(0.0001)),
            (erf(Float32(0)), Float32(0), Float32(0.0001)),
            (erf(Float32(inf32)), Float32(1), Float32(0.001)),
            (erf(Float32(-inf32)), Float32(-1), Float32(0.001))
        ],
        description: "public func erf(x: float32) : float32"
    )
    CaseRunner<Float64>().runCases(
        [
            (erf(Float64(-0.52452)), Float64(-0.541781), Float64(0.0001)),
            (erf(Float64(0.52452)), Float64(0.541781), Float64(0.0001)),
            (erf(Float64(0)), Float64(0), Float64(0.0001)),
            (erf(Float64(inf64)), Float64(1), Float64(0.001)),
            (erf(Float64(-inf64)), Float64(-1), Float64(0.001))
        ],
        description: "public func erf(x: float64) : float64"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            erf(nan16).isNaN(),
            erf(-nan16).isNaN(),
            erf(nan32).isNaN(),
            erf(-nan32).isNaN(),
            erf(nan64).isNaN(),
            erf(-nan64).isNaN()
        ],
        description: "入参是nan"
    )
    return 0
}
