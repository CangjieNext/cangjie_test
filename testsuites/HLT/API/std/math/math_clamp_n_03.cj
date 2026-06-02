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
        [(clamp(Float16(2.83), Float16(5.83), Float16(5.83)), Float16(5.83), Float16(0.0001))],
        description: "clamp（）函数入参是Float16，且min=max,v<min"
    )
    CaseRunner<Float32>().runCases(
        [(clamp(Float32(2.83), Float32(5.83), Float32(5.83)), Float32(5.83), Float32(0.0001))],
        description: "clamp（）函数入参是Float32，且min=max,v<min"
    )
    CaseRunner<Float64>().runCases(
        [(clamp(Float64(2.83), Float64(5.83), Float64(5.83)), Float64(5.83), Float64(0.0001))],
        description: "clamp（）函数入参是Float64，且min=max,v<min"
    )
    return 0
}
