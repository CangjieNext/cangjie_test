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
    CaseRunner<Bool>().runCases(
        [
            (tanh(nan16).isNaN(), true),
            (tanh(-nan16).isNaN(), true)
        ],
        description: "public func tanh(x: Float16): Float16入参是nan"
    )
    CaseRunner<Bool>().runCases(
        [
            (tanh(nan32).isNaN(), true),
            (tanh(-nan32).isNaN(), true)
        ],
        description: "public func tanh(x: Float32): Float32入参是nan"
    )
    CaseRunner<Bool>().runCases(
        [
            (tanh(nan64).isNaN(), true),
            (tanh(-nan64).isNaN(), true)
        ],
        description: "public func tanh(x: Float64): Float64入参是nan"
    )
    return 0
}
