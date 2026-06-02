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
            (sinh(Float16(-1)), Float16(-1.174805), Float16(0.0001)),
            (sinh(Float16(1)), Float16(1.174805), Float16(0.0001))
        ],
        description: "public func sinh(x: Float16): Float16"
    )
    CaseRunner<Float32>().runCases(
        [
            (sinh(Float32(-1)), Float32(-1.175201), Float32(0.0001)),
            (sinh(Float32(1)), Float32(1.175201), Float32(0.0001))
        ],
        description: "public func sinh(x: Float32): Float32"
    )
    CaseRunner<Float64>().runCases(
        [
            (sinh(Float64(-1)), Float64(-1.175201), Float64(0.0001)),
            (sinh(Float64(1)), Float64(1.175201), Float64(0.0001))
        ],
        description: "public func sinh(x: Float64): Float64"
    )
    return 0
}
