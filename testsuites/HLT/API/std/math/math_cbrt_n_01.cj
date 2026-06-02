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
            (cbrt(Float16(8.0)), Float16(2.0), Float16(0.0001)), //x为正整数，取得准确的立方根
            (cbrt(Float16(0.125)), Float16(0.5), Float16(0.0001)), //x为正小数，取得准确的立方根
            (cbrt(Float16(0)), Float16(0), Float16(0.0001)), //x=0:特殊值
            (cbrt(Float16(-0)), Float16(0), Float16(0.0001)), //x=-0：特殊值
            (cbrt(Float16(-8.0)), Float16(-2.0), Float16(0.0001)), //x为负整数，取得准确的立方根
            (cbrt(Float16(-0.125)), Float16(-0.5), Float16(0.0001)) //x为负小数，取得准确的立方根
        ],
        description: "cbrt()函数入参是Float16，返回值计算准确"
    )
    CaseRunner<Float32>().runCases(
        [
            (cbrt(Float32(8.0)), Float32(2.0), Float32(0.0001)), //x为正整数，取得准确的立方根
            (cbrt(Float32(0.125)), Float32(0.5), Float32(0.0001)), //x为正小数，取得准确的立方根
            (cbrt(Float32(0)), Float32(0), Float32(0.0001)), //x=0:特殊值
            (cbrt(Float32(-0)), Float32(0), Float32(0.0001)), //x=-0：特殊值
            (cbrt(Float32(-8.0)), Float32(-2.0), Float32(0.0001)), //x为负整数，取得准确的立方根
            (cbrt(Float32(-0.125)), Float32(-0.5), Float32(0.0001)) //x为负小数，取得准确的立方根
        ],
        description: "cbrt()函数入参是Float32，返回值计算准确"
    )
    CaseRunner<Float64>().runCases(
        [
            (cbrt(Float64(8.0)), Float64(2.0), Float64(0.0001)), //x为正整数，取得准确的立方根
            (cbrt(Float64(0.125)), Float64(0.5), Float64(0.0001)), //x为正小数，取得准确的立方根
            (cbrt(Float64(0)), Float64(0), Float64(0.0001)), //x=0:特殊值
            (cbrt(Float64(-0)), Float64(0), Float64(0.0001)), //x=-0：特殊值
            (cbrt(Float64(-8.0)), Float64(-2.0), Float64(0.0001)), //x为负整数，取得准确的立方根
            (cbrt(Float64(-0.125)), Float64(-0.5), Float64(0.0001)) //x为负小数，取得准确的立方根
        ],
        description: "cbrt()函数入参是Float32，返回值计算准确"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            //x为Float16:NaN，返回Float16:NaN
            cbrt(nan16).isNaN(),
            cbrt(-nan16).isNaN(),
            cbrt(nan32).isNaN(),
            cbrt(-nan32).isNaN(),
            cbrt(nan64).isNaN(),
            cbrt(-nan64).isNaN()
        ],
        description: "cbrt()函数入参是nan，返回值是nan"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            inf16.isInf(),
            (-inf16).isInf(),
            inf32.isInf(),
            (-inf32).isInf(),
            inf64.isInf(),
            (-inf64).isInf()
        ],
        description: "cbrt()函数入参是inf，返回值是inf"
    )
    return 0
}
