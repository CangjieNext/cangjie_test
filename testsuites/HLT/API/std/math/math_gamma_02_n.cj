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
            //x为负数
            (gamma(Float16(-10.25)), Float16(-0.000001), Float16(0.0001)),
            //x为正数
            (gamma(Float16(10.25)), Float16(639232.598780), Float16(0.0001)),
            (gamma(inf16), inf16, Float16(0.0001))
        ],
        description: "public func gamma(x: float16) : float16"
    )
    CaseRunner<Float32>().runCases(
        [
            //x为负数
            //报错
            (gamma(Float32(-10.25)), Float32(-0.000001), Float32(0.0001)),
            //x为正数
            (gamma(Float32(10.25)), Float32(639232.5625000), Float32(0.0001)),
            (gamma(inf32), inf32, Float32(0.0001))
        ],
        description: "public func gamma(x: float32) : float32"
    )
    var x64: Float64 = 639232.598780
    CaseRunner<Float64>().runCases(
        [
            //x为负数
            (gamma(Float64(-10.25)), Float64(-0.000001), Float64(0.0001)),
            //x为正数
            (gamma(Float64(10.25)), x64, Float64(0.0001)),
            (gamma(inf64), inf64, Float64(0.0001))
        ],
        description: "public func gamma(x: float64) : float64"
    )
    return 0
}
