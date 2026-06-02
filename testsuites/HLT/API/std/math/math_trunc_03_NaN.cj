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
            trunc(nan16).isNaN(),
            trunc(-nan16).isNaN()
        ],
        description: "public func trunc(x: float16) : float16"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            trunc(nan32).isNaN(),
            trunc(-nan32).isNaN()
        ],
        description: "public func trunc(x: float32) : float32"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            trunc(nan64).isNaN(),
            trunc(-nan64).isNaN()
        ],
        description: "public func trunc(x: float64) : float64"
    )
    return 0
}
