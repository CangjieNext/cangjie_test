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
            (cosh(Float16(-1)), Float16(1.542969), Float16(0.0001)),
            (cosh(Float16(1)), Float16(1.542969), Float16(0.0001)),
            (cosh(Float16(0)), Float16(1), Float16(0.0001)),
            (cosh(inf16), inf16, Float16(0.0001)),
            (cosh(-inf16), inf16, Float16(0.0001))
        ],
        description: "public func cosh(x: Float16): Float16"
    )
    CaseRunner<Float32>().runCases(
        [
            (cosh(Float32(-1)), Float32(1.543081), Float32(0.0001)),
            (cosh(Float32(1)), Float32(1.543081), Float32(0.0001)),
            (cosh(Float32(0)), Float32(1), Float32(0.0001)),
            (cosh(inf32), inf32, Float32(0.0001)),
            (cosh(-inf32), inf32, Float32(0.0001))
        ],
        description: "public func cosh(x: Float32): Float32"
    )
    CaseRunner<Float64>().runCases(
        [
            (cosh(Float64(-1)), Float64(1.543081), Float64(0.0001)),
            (cosh(Float64(1)), Float64(1.543081), Float64(0.0001)),
            (cosh(Float64(0)), Float64(1), Float64(0.0001)),
            (cosh(inf64), inf64, Float64(0.0001)),
            (cosh(-inf64), inf64, Float64(0.0001))
        ],
        description: "public func cosh(x: Float64): Float64"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            cosh(nan16).isNaN(),
            cosh(-nan16).isNaN(),
            cosh(nan32).isNaN(),
            cosh(-nan32).isNaN(),
            cosh(nan64).isNaN(),
            cosh(-nan64).isNaN()
        ],
        description: "入参是nan"
    )
    return 0
}
