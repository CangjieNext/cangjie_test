/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: caserunner.cj
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not Exception

import std.math.*

main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            pow(Float64(-2.2), Float64(2.2)).isNaN(),
            pow(Float64(-2.2), Float64(-2.2)).isNaN(),
            pow(Float64(-2), Float64(2.2)).isNaN(),
            pow(Float64(-2), Float64(-2.2)).isNaN()
        ],
        description: "public func pow(base: float64, exponent: float64) : float64"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            pow(Float32(-2.2), Float32(2.2)).isNaN(),
            pow(Float32(-2.2), Float32(-2.2)).isNaN(),
            pow(Float32(-2), Float32(2.2)).isNaN(),
            pow(Float32(-2), Float32(-2.2)).isNaN()
        ],
        description: "public func pow(base: float32, exponent: float32) : float32"
    )
    return 0
}
