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
    CaseRunner<Float32>().runCases(
        [
            //x是正小数，y取正小数
            (logBase(Float32(2.718281), Float32(7.389056)), Float32(0.5), Float32(0.001)),
            //x是正小数，y取正整数
            (logBase(Float32(2.718281), Float32(4)), Float32(0.721348), Float32(0.001)),
            //x是正整数，y取正小数,
            (logBase(Float32(4), Float32(2.718281)), Float32(1.386294), Float32(0.001)),
            //x是正整数，y取正整数
            (logBase(Float32(2), Float32(2)), Float32(1), Float32(0.001))
        ],
        description: "入参是正数"
    )
    CaseRunner<Float32>().runCases(
        [
            (logBase(inf32, Float32(7.389056)), inf32, Float32(0.15)),
            (logBase(Float32(2.718281), inf32), Float32(0), Float32(0.15))
        ],
        description: "入参存在一个是inf32"
    )
    CaseRunner<Bool>().runCasesTrue(
        [logBase(inf32, inf32).isNaN()],
        description: "入参两个都是inf"
    )
    return 0
}
