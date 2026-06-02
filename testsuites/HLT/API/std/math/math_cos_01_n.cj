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
            (cos(Float16(-1.57)), Float16(0.000796), Float16(0.001)),
            (cos(Float16(1.57)), Float16(0.000796), Float16(0.001)),
            (cos(Float16(0)), Float16(1), Float16(0.001))
        ],
        description: "public func cos(x: Float16): Float16"
    )
    CaseRunner<Float32>().runCases(
        [
            (cos(Float32(-1.57)), Float32(0.000796), Float32(0.0001)),
            (cos(Float32(1.57)), Float32(0.000796), Float32(0.0001)),
            (cos(Float32(0)), Float32(1), Float32(0.001))
        ],
        description: "public func cos(x: Float32): Float32"
    )
    CaseRunner<Float64>().runCases(
        [
            (cos(Float64(-1.57)), Float64(0.000796), Float64(0.0001)),
            (cos(Float64(1.57)), Float64(0.000796), Float64(0.0001)),
            (cos(Float64(0)), Float64(1), Float64(0.001))
        ],
        description: "public func cos(x: Float64): Float64"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            cos(inf16).isNaN(),
            cos(-inf16).isNaN(),
            cos(inf32).isNaN(),
            cos(-inf32).isNaN(),
            cos(inf64).isNaN(),
            cos(-inf64).isNaN()
        ],
        description: "入参是inf"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            cos(nan16).isNaN(),
            cos(-nan16).isNaN(),
            cos(nan32).isNaN(),
            cos(-nan32).isNaN(),
            cos(nan64).isNaN(),
            cos(-nan64).isNaN()
        ],
        description: "入参是nan"
    )
    return 0
}
