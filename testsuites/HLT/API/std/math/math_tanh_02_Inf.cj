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
            (tanh(inf16), Float16(1.0), Float16(0.0001)),
            (tanh(-inf16), Float16(-1), Float16(0.0001))
        ],
        description: "public func tanh(x: Float16): Float16入参是inf"
    )
    CaseRunner<Float32>().runCases(
        [
            (tanh(inf32), Float32(1.0), Float32(0.0001)),
            (tanh(-inf32), Float32(-1), Float32(0.0001))
        ],
        description: "public func tanh(x: Float32): Float32入参是inf"
    )
    CaseRunner<Float64>().runCases(
        [
            (tanh(inf64), Float64(1.0), Float64(0.0001)),
            (tanh(-inf64), Float64(-1), Float64(0.0001))
        ],
        description: "public func tanh(x: Float64): Float64入参是inf"
    )
    return 0
}
