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
    CaseRunner<Float64>().runCases(
        [
            (pow(Float64(2.2), Float64(2.2)), Float64(5.666695), Float64(0.001)),
            (pow(Float64(2.2), Float64(2)), Float64(4.84), Float64(0.001)),
            (pow(Float64(2.2), Float64(-2.2)), Float64(0.176470), Float64(0.001)),
            (pow(Float64(2.2), Float64(-2)), Float64(0.206611), Float64(0.001)),
            (pow(Float64(2.2), -inf64), Float64(0), Float64(0.001)),
            (pow(-inf64, -inf64), Float64(0), Float64(0.001)),
            (pow(inf64, -inf64), Float64(0), Float64(0.001))
        ],
        description: "base是正小数,exponent是整数，小数"
    )
    CaseRunner<Float64>().runCases(
        [
            (pow(Float64(2), Float64(2.2)), Float64(4.594793), Float64(0.001)),
            (pow(Float64(2), Float64(2)), Float64(4), Float64(0.001)),
            (pow(Float64(2), Float64(-2.2)), Float64(0.217637), Float64(0.001)),
            (pow(Float64(2), Float64(-2)), Float64(0.25), Float64(0.001))
        ],
        description: "base是正整数,exponent是整数，小数"
    )
    CaseRunner<Float64>().runCases(
        [
            (pow(Float64(-2.2), Float64(2)), Float64(4.84), Float64(0.001)),
            (pow(Float64(-2.2), Float64(-2)), Float64(0.206611), Float64(0.001))
        ],
        description: "base是负小数,exponent是整数"
    )

    CaseRunner<Float64>().runCases(
        [
            (pow(Float64(-2), Float64(2)), Float64(4), Float64(0.001)),
            (pow(Float64(-2), Float64(-2)), Float64(0.25), Float64(0.001))
        ],
        description: "base是负整数,exponent是整数"
    )

    CaseRunner<Float64>().runCases(
        [
            (pow(Float64(-0), Float64(2)), Float64(0), Float64(0.001)),
            (pow(Float64(0), Float64(2)), Float64(0), Float64(0.001))
        ],
        description: "特殊值：base=0，exponent是正整数"
    )

    CaseRunner<Bool>().runCasesTrue(
        [
            pow(Float64(0), Float64(-2)).isInf(),
            pow(Float64(-0), Float64(-2)).isInf()
        ],
        description: "特殊值：base=0,exponent是负整数"
    )

    return 0
}
