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
    CaseRunner<Float16>().runCases(
        [
            (asin(Float16(-1)), Float16(-1.570312), Float16(0.0001)), //x为负数
            (asin(Float16(1)), Float16(1.570312), Float16(0.0001)) //x为正数
        ],
        description: "asin()入参是Float16,且在定义域范围内，返回正常值"
    )
    CaseRunner<Float32>().runCases(
        [
            (asin(Float32(-1)), Float32(-1.570796), Float32(0.0001)), //x为负数
            (asin(Float32(1)), Float32(1.570796), Float32(0.0001)) //x为正数
        ],
        description: "asin()入参是Float32,且在定义域范围内，返回正常值"
    )
    CaseRunner<Float64>().runCases(
        [
            (asin(Float64(-1)), Float64(-1.570796), Float64(0.0001)), //x为负数
            (asin(Float64(1)), Float64(1.570796), Float64(0.0001)) //x为正数
        ],
        description: "asin()入参是Float64,且在定义域范围内，返回正常值"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            asin(nan16).isNaN(),
            asin(-nan16).isNaN(),
            asin(nan32).isNaN(),
            asin(-nan32).isNaN(),
            asin(nan64).isNaN(),
            asin(-nan64).isNaN()
        ],
        description: "asin()入参是nan,返回为nan"
    )
    return 0
}
