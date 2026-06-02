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
            (asinh(Float16(-1)), Float16(-0.881348), Float16(0.0001)), //x为负数
            (asinh(Float16(1)), Float16(0.881348), Float16(0.0001)) //x为正数
        ],
        description: "asinh()入参是Float16,且在定义域范围内，返回正常值"
    )
    CaseRunner<Float32>().runCases(
        [
            (asinh(Float32(-1)), Float32(-0.881374), Float32(0.0001)), //x为负数
            (asinh(Float32(1)), Float32(0.881374), Float32(0.0001)) //x为正数
        ],
        description: "asinh()入参是Float32,且在定义域范围内，返回正常值"
    )
    CaseRunner<Float64>().runCases(
        [
            (asinh(Float64(-1)), Float64(-0.881374), Float64(0.0001)), //x为负数
            (asinh(Float64(1)), Float64(0.881374), Float64(0.0001)) //x为正数
        ],
        description: "asinh()入参是Float64,且在定义域范围内，返回正常值"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            asinh(-nan16).isNaN(),
            asinh(nan16).isNaN(),
            asinh(-nan32).isNaN(),
            asinh(nan32).isNaN(),
            asinh(-nan64).isNaN(),
            asinh(nan64).isNaN()
        ],
        description: "asinh()入参是nan,返回为nan"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            asinh(-inf16).isInf(),
            asinh(inf16).isInf(),
            asinh(-inf32).isInf(),
            asinh(inf32).isInf(),
            asinh(-inf64).isInf(),
            asinh(inf64).isInf()
        ],
        description: "asinh()入参是inf,返回为inf"
    )
    return 0
}
