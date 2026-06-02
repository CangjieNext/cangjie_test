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
            (atan(Float16(-1)), Float16(-0.785156), Float16(0.0001)), //x为负数
            (atan(Float16(1)), Float16(0.785156), Float16(0.0001)), //x为正数
            (atan(Float16(inf16)), Float16(1.5707), Float16(0.0001)), //x为inf
            (atan(Float16(-inf16)), Float16(-1.5707), Float16(0.0001)) //x为-inf
        ],
        description: "atan()入参是Float16,且在定义域范围内，返回正常值"
    )
    CaseRunner<Float32>().runCases(
        [
            (atan(Float32(-1)), Float32(-0.785398), Float32(0.0001)), //x为负数
            (atan(Float32(1)), Float32(0.785398), Float32(0.0001)), //x为正数
            (atan(Float32(inf32)), Float32(1.5707), Float32(0.0001)), //x为inf
            (atan(Float32(-inf32)), Float32(-1.5707), Float32(0.0001)) //x为-inf       
        ],
        description: "atan()入参是Float32,且在定义域范围内，返回正常值"
    )
    CaseRunner<Float64>().runCases(
        [
            (atan(Float64(-1)), Float64(-0.785398), Float64(0.0001)), //x为负数
            (atan(Float64(1)), Float64(0.785398), Float64(0.0001)), //x为正数
            (atan(Float64(inf64)), Float64(1.5707), Float64(0.0001)), //x为inf
            (atan(Float64(-inf64)), Float64(-1.5707), Float64(0.0001)) //x为-inf       
        ],
        description: "atan()入参是Float64,且在定义域范围内，返回正常值"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            atan(nan16).isNaN(),
            atan(-nan16).isNaN(),
            atan(nan32).isNaN(),
            atan(-nan32).isNaN(),
            atan(nan64).isNaN(),
            atan(-nan64).isNaN()
        ],
        description: "atan()入参是nan,返回nan"
    )

    return 0
}
