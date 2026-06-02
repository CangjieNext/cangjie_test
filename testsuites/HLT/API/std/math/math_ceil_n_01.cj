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
            (ceil(Float16(-4.9665)), Float16(-4), Float16(0.0001)),
            (ceil(Float16(-10.25)), Float16(-10), Float16(0.0001)),
            (ceil(Float16(10.25)), Float16(11), Float16(0.0001)),
            (ceil(Float16(4.9665)), Float16(5), Float16(0.0001)),
            (ceil(Float16(10)), Float16(10), Float16(0.0001)),
            (ceil(Float16(-5)), Float16(-5), Float16(0.0001)),
            (ceil(Float16(-0)), Float16(0), Float16(0.0001)),
            (ceil(Float16(0)), Float16(0), Float16(0.0001))
        ],
        description: "ceil()函数入参是Float16，返回值结果正确"
    )
    CaseRunner<Float32>().runCases(
        [
            (ceil(Float32(-4.9665)), Float32(-4), Float32(0.0001)),
            (ceil(Float32(-10.25)), Float32(-10), Float32(0.0001)),
            (ceil(Float32(10.25)), Float32(11), Float32(0.0001)),
            (ceil(Float32(4.9665)), Float32(5), Float32(0.0001)),
            (ceil(Float32(10)), Float32(10), Float32(0.0001)),
            (ceil(Float32(-5)), Float32(-5), Float32(0.0001)),
            (ceil(Float32(-0)), Float32(0), Float32(0.0001)),
            (ceil(Float32(0)), Float32(0), Float32(0.0001))
        ],
        description: "ceil()函数入参是Float32，返回值结果正确"
    )
    CaseRunner<Float64>().runCases(
        [
            (ceil(Float64(-4.9665)), Float64(-4), Float64(0.0001)), //x为负数，靠近下整
            (ceil(Float64(-10.25)), Float64(-10), Float64(0.0001)), //x为负数，靠近上整
            (ceil(Float64(10.25)), Float64(11), Float64(0.0001)), //x为正数，靠近上整
            (ceil(Float64(4.9665)), Float64(5), Float64(0.0001)), //x为正数，靠近下整
            (ceil(Float64(10)), Float64(10), Float64(0.0001)), //x为正整数
            (ceil(Float64(-5)), Float64(-5), Float64(0.0001)), //x为负整数
            (ceil(Float64(-0)), Float64(0), Float64(0.0001)), //特殊值0，预期结果正确
            (ceil(Float64(0)), Float64(0), Float64(0.0001))
        ],
        description: "ceil()函数入参是Float64，返回值结果正确"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            ceil(Float16(nan16)).isNaN(),
            ceil(Float16(-nan16)).isNaN(),
            ceil(Float16(nan32)).isNaN(),
            ceil(Float16(-nan32)).isNaN(),
            ceil(Float32(nan64)).isNaN(),
            ceil(Float64(-nan64)).isNaN()
        ],
        description: "ceil()函数入参是nan,返回值是nan"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            ceil(inf16).isInf(),
            ceil(-inf16).isInf(),
            ceil(inf32).isInf(),
            ceil(-inf32).isInf(),
            ceil(inf64).isInf(),
            ceil(-inf64).isInf()
        ],
        description: "ceil()函数入参是inf,返回值是inf"
    )
    return 0
}
