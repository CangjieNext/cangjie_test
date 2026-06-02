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
            (min(inf16, Float16(5)), Float16(5), Float16(0.0001)),
            (min(Float16(5), inf16), Float16(5), Float16(0.0001)),
            (min(-inf16, Float16(5)), -inf16, Float16(0.0001)),
            (min(Float16(5), -inf16), -inf16, Float16(0.0001)),
            (min(inf16, inf16), inf16, Float16(0.0001)),
            (min(-inf16, inf16), -inf16, Float16(0.0001))
        ],
        description: "public func min(a: Float16, b: Float16): Float16"
    )
    CaseRunner<Float32>().runCases(
        [
            (min(inf32, Float32(5)), Float32(5), Float32(0.0001)),
            (min(Float32(5), inf32), Float32(5), Float32(0.0001)),
            (min(-inf32, Float32(5)), -inf32, Float32(0.0001)),
            (min(Float32(5), -inf32), -inf32, Float32(0.0001)),
            (min(inf32, inf32), inf32, Float32(0.0001)),
            (min(-inf32, inf32), -inf32, Float32(0.0001))
        ],
        description: "public func min(a: Float32, b: Float32): Float32"
    )
    CaseRunner<Float64>().runCases(
        [
            (min(inf64, Float64(5)), Float64(5), Float64(0.0001)),
            (min(Float64(5), inf64), Float64(5), Float64(0.0001)),
            (min(-inf64, Float64(5)), -inf64, Float64(0.0001)),
            (min(Float64(5), -inf64), -inf64, Float64(0.0001)),
            (min(inf64, inf64), inf64, Float64(0.0001)),
            (min(-inf64, inf64), -inf64, Float64(0.0001))
        ],
        description: "public func min(a: Float64, b: Float64): Float64"
    )
    return 0
}
