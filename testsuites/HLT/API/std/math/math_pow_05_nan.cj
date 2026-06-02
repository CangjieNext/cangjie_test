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
            pow(Float32(2.2), nan32).isNaN(),
            pow(Float32(2.2), -nan32).isNaN(),
            pow(nan32, Float32(2.2)).isNaN(),
            pow(-nan32, Float32(2.2)).isNaN(),
            pow(nan32, nan32).isNaN(),
            pow(nan32, -nan32).isNaN(),
            pow(-nan32, nan32).isNaN(),
            pow(-nan32, -nan32).isNaN()
        ],
        description: "public func pow(base: float32, exponent: float32) : float32"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            pow(Float64(2.2), nan64).isNaN(),
            pow(Float64(2.2), (-nan64)).isNaN(),
            pow(nan64, Float64(2.2)).isNaN(),
            pow(-nan64, Float64(2.2)).isNaN(),
            pow(nan64, nan64).isNaN(),
            pow(nan64, -nan64).isNaN(),
            pow(-nan64, nan64).isNaN(),
            pow(-nan64, -nan64).isNaN()
        ],
        description: "public func pow(base: float64, exponent: float64) : float64"
    )
    return 0
}
