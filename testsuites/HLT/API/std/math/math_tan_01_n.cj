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
            (tan(Float16(-1.57)), Float16(-2065.721449), Float16(0.001)),
            (tan(Float16(1.57)), Float16(2065.721449), Float16(0.001))
        ],
        description: "public func tan(x: Float16): Float16"
    )
    CaseRunner<Float32>().runCases(
        [
            (tan(Float32(-1.57)), Float32(-1255.848267), Float32(0.0001)),
            (tan(Float32(1.57)), Float32(1255.848267), Float32(0.0001))
        ],
        description: "public func tan(x: Float32): Float32"
    )
    CaseRunner<Float64>().runCases(
        [
            (tan(Float64(-1.57)), Float64(-1255.765592), Float64(0.0001)),
            (tan(Float64(1.57)), Float64(1255.765592), Float64(0.0001))
        ],
        description: "public func tan(x: Float64): Float64"
    )
    return 0
}
