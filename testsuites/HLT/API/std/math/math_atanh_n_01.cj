/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj
// EXEC: %compiler %cmp_opt caserunner.cj -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not Exception
import std.math.*

main() {
    CaseRunner<Float16>().runCases(
        [
            (atanh(Float16(-0.5)), Float16(-0.549316), Float16(0.0001)), //x为负数
            (atanh(Float16(0.5)), Float16(0.549316), Float16(0.0001)) //x为正数
        ],
        description: "atanh()入参是Float16,且在定义域范围内，返回正常值"
    )
    CaseRunner<Float32>().runCases(
        [
            (atanh(Float32(-0.5)), Float32(-0.549306), Float32(0.0001)), //x是负数
            (atanh(Float32(0.5)), Float32(0.549306), Float32(0.0001)) //x为正数
        ],
        description: "atanh()入参是Float32,且在定义域范围内，返回正常值"
    )
    CaseRunner<Float64>().runCases(
        [
            (atanh(Float64(-0.5)), Float64(-0.549306), Float64(0.0001)), //x为负数
            (atanh(Float64(0.5)), Float64(0.549306), Float64(0.0001)) //x为正数
        ],
        description: "atanh()入参是Float64,且在定义域范围内，返回正常值"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            atanh(nan16).isNaN(),
            atanh(-nan16).isNaN(),
            atanh(nan32).isNaN(),
            atanh(-nan32).isNaN(),
            atanh(nan64).isNaN(),
            atanh(-nan64).isNaN()
        ],
        description: "atanh()入参是nan，返回nan"
    )
    return 0
}
