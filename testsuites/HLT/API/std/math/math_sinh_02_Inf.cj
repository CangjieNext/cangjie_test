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
            sinh(inf16).isInf(),
            sinh(-inf16).isInf()
        ],
        description: "public func sinh(x: Float16): Float16"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            sinh(inf32).isInf(),
            sinh(-inf32).isInf()
        ],
        description: "public func sinh(x: Float32): Float32"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            sinh(inf64).isInf(),
            sinh(-inf64).isInf()
        ],
        description: "public func sinh(x: Float64): Float64"
    )
    return 0
}
