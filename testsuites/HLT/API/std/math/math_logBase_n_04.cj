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
            logBase(nan16, Float16(5)).isNaN(),
            logBase(Float16(5), nan16).isNaN(),
            logBase(nan16, nan16).isNaN()
        ],
        description: "public func logBase(x: Float16, y: Float16): Float16"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            logBase(nan32, Float32(5)).isNaN(),
            logBase(Float32(5), nan32).isNaN(),
            logBase(nan32, nan32).isNaN()
        ],
        description: "public func logBase(x: Float32, y: Float32): Float32"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            logBase(nan64, Float64(5)).isNaN(),
            logBase(Float64(5), nan64).isNaN(),
            logBase(nan64, nan64).isNaN()
        ],
        description: "public func logBase(x: Float64, y: Float64): Float64"
    )
    return 0
}
