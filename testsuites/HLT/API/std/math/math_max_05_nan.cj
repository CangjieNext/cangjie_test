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
    CaseRunner<Bool>().runCasesTrue(
        [
            max(Float16(5), nan16).isNaN(),
            max(nan16, nan16).isNaN(),
            max(nan16, Float16(5)).isNaN()
        ],
        description: "public func max(a: Float16, b: Float16): Float16"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            max(Float32(5), nan32).isNaN(),
            max(nan32, nan32).isNaN(),
            max(nan32, Float32(5)).isNaN()
        ],
        description: "public func max(a: Float32, b: Float32): Float32"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            max(Float64(5), nan64).isNaN(),
            max(nan64, nan64).isNaN(),
            max(nan64, Float64(5)).isNaN()
        ],
        description: "public func max(a: Float64, b: Float64): Float64"
    )
    return 0
}
