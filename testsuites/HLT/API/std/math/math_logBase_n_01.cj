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
    CaseRunner<Float16>().runCases(
        [
            //x是正小数，y取正小数
            (logBase(Float16(2.718281), Float16(7.389056)), Float16(0.5), Float16(0.15)),
            //x是正小数，y取正整数
            (logBase(Float16(2.718281), Float16(4)), Float16(0.721348), Float16(0.15)),
            //x是正整数，y取正小数
            (logBase(Float16(4), Float16(2.718281)), Float16(1.386294), Float16(0.15)),
            //x是正整数，y取正整数
            (logBase(Float16(2), Float16(2)), Float16(1), Float16(0.001))
        ],
        description: "入参是正数"
    )
    CaseRunner<Float16>().runCases(
        [
            (logBase(inf16, Float16(7.389056)), inf16, Float16(0.15)),
            (logBase(Float16(2.718281), inf16), Float16(0), Float16(0.15))
        ],
        description: "入参存在一个是inf16"
    )
    CaseRunner<Bool>().runCasesTrue(
        [logBase(inf16, inf16).isNaN()],
        description: "入参两个都是inf"
    )
    return 0
}
