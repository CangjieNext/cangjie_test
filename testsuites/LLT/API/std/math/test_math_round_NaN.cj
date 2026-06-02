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
            round(nan16).isNaN(),
            round(-nan16).isNaN()
        ],
        description: "public func round(x: Float16) : Float16 - NaN handling"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            round(nan32).isNaN(),
            round(-nan32).isNaN()
        ],
        description: "public func round(x: Float32) : Float32 - NaN handling"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            round(nan64).isNaN(),
            round(-nan64).isNaN()
        ],
        description: "public func round(x: Float64) : Float64 - NaN handling"
    )
    return 0
}
