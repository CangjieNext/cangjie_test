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
            (acosh(Float16(1)), Float16(0.000000), Float16(0.001)), //x为边界值
            (acosh(Float16(1.1)), Float16(0.443604), Float16(0.001)) //x为正数
        ],
        description: "acosh()函数入参是Float16,且在定义域范围之内，返回值是其函数值"
    )
    CaseRunner<Float32>().runCases(
        [
            (acosh(Float32(1)), Float32(0.000000), Float32(0.0001)), //x为边界值
            (acosh(Float32(1.1)), Float32(0.443568), Float32(0.0001)) //x为正数
        ],
        description: "acosh()函数入参是Float32,且在定义域范围之内，返回值是其函数值" /**用例描述**/
    )
    CaseRunner<Float64>().runCases(
        [
            (acosh(Float64(1)), Float64(0.000000), Float64(0.0001)), //x为正数
            (acosh(Float64(1.1)), Float64(0.443568), Float64(0.0001))
        ],
        description: "acosh()函数入参是Float64,且在定义域范围之内，返回值是其函数值"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            acosh(nan16).isNaN(),
            acosh(-nan16).isNaN(),
            acosh(nan32).isNaN(),
            acosh(-nan32).isNaN(),
            acosh(nan64).isNaN(),
            acosh(-nan64).isNaN()
        ],
        description: "acosh()函数入参是nan,返回值是nan"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            acosh(inf16).isInf(),
            acosh(inf32).isInf(),
            acosh(inf64).isInf()
        ],
        description: "acosh()函数入参是inf,返回值是inf"
    )
    return 0
}
