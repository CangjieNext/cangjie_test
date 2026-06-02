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
            //x是正小数，y取正小数
            (logBase(Float64(2.718281), Float64(7.389056)), Float64(0.5), Float64(0.001)),
            //x是正小数，y取正整数
            (logBase(Float64(2.718281), Float64(4)), Float64(0.721348), Float64(0.001)),
            //x是正整数，y取正小数
            (logBase(Float64(4), Float64(2.718281)), Float64(1.386294), Float64(0.001)),
            //x是正整数，y取正整数
            (logBase(Float64(2), Float64(2)), Float64(1), Float64(0.001))
        ],
        description: "入参是正数"
    )
    CaseRunner<Float64>().runCases(
        [
            (logBase(inf64, Float64(7.389056)), inf64, Float64(0.15)),
            (logBase(Float64(2.718281), inf64), Float64(0), Float64(0.15))
        ],
        description: "入参存在一个是inf64"
    )
    CaseRunner<Bool>().runCasesTrue(
        [logBase(inf64, inf64).isNaN()],
        description: "入参两个都是inf"
    )
    return 0
}
