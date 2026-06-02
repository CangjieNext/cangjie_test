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
            //入参至少有一个是Float16:NaN
            min(Float16(5), nan16).isNaN(),
            min(nan16, Float16(5)).isNaN(),
            min(nan16, nan16).isNaN()
        ],
        description: "public func min(a: Float16, b: Float16): Float16"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            min(Float32(5), nan32).isNaN(),
            min(nan32, Float32(5)).isNaN(),
            min(nan32, nan32).isNaN()
        ],
        description: "public func min(a: Float32, b: Float32): Float32"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            min(Float64(5), nan64).isNaN(),
            min(nan64, Float64(5)).isNaN(),
            min(nan64, nan64).isNaN()
        ],
        description: "public func min(a: Float64, b: Float64): Float64"
    )
    return 0
}
