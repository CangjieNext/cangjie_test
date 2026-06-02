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
            (acos(Float16(-1)), Float16(3.140625), Float16(0.0001)), //x为负数
            (acos(Float16(1)), Float16(0.000000), Float16(0.0001)) //x为正数
        ],
        description: "acos()入参是Float16,且在定义域范围内，返回正常值"
    )
    CaseRunner<Float32>().runCases(
        [
            (acos(Float32(-1)), Float32(3.141593), Float32(0.0001)), //x为负数
            (acos(Float32(1)), Float32(0.000000), Float32(0.0001)) //x为正数
        ],
        description: "acos()入参是Float32,且在定义域范围内，返回正常值"
    )
    CaseRunner<Float64>().runCases(
        [
            (acos(Float64(-1)), Float64(3.141593), Float64(0.0001)), //x为负数
            (acos(Float64(1)), Float64(0.000000), Float64(0.0001)) //x为正数
        ],
        description: "acos()入参是Float64,且在定义域范围内，返回正常值"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            acos(nan16).isNaN(),
            acos(-nan16).isNaN(),
            acos(nan32).isNaN(),
            acos(-nan32).isNaN(),
            acos(nan64).isNaN(),
            acos(-nan64).isNaN()
        ],
        description: "acos()入参是nan,返回为nan"
    )
    return 0
}
