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
            //x为负数，靠近下整
            (floor(Float16(-4.9665)), Float16(-5), Float16(0.0001)),
            //x为负数，靠近上整
            (floor(Float16(-10.25)), Float16(-11), Float16(0.0001)),
            //x为正数，靠近上整
            (floor(Float16(10.25)), Float16(10), Float16(0.0001)),
            //x为正数，靠近下整
            (floor(Float16(4.9665)), Float16(4), Float16(0.0001)),
            //x为正整数
            (floor(Float16(5)), Float16(5), Float16(0.0001)),
            //x为负整数
            (floor(Float16(-5)), Float16(-5), Float16(0.0001)),
            //特殊值0，预期结果正确
            (floor(Float16(-0)), Float16(0), Float16(0.0001)),
            (floor(Float16(0)), Float16(0), Float16(0.0001))
        ],
        description: "public func floor(x: float16): float16"
    )
    CaseRunner<Float32>().runCases(
        [
            //x为负数，靠近下整
            (floor(Float32(-4.9665)), Float32(-5), Float32(0.0001)),
            //x为负数，靠近上整
            (floor(Float32(-10.25)), Float32(-11), Float32(0.0001)),
            //x为正数，靠近上整
            (floor(Float32(10.25)), Float32(10), Float32(0.0001)),
            //x为正数，靠近下整
            (floor(Float32(4.9665)), Float32(4), Float32(0.0001)),
            //x为正整数
            (floor(Float32(5)), Float32(5), Float32(0.0001)),
            //x为负整数
            (floor(Float32(-5)), Float32(-5), Float32(0.0001)),
            //特殊值0，预期结果正确
            (floor(Float32(-0)), Float32(0), Float32(0.0001)),
            (floor(Float32(0)), Float32(0), Float32(0.0001))
        ],
        description: "public func floor(x: float32): float32"
    )
    CaseRunner<Float64>().runCases(
        [
            //x为负数，靠近下整
            (floor(Float64(-4.9665)), Float64(-5), Float64(0.0001)),
            //x为负数，靠近上整
            (floor(Float64(-10.25)), Float64(-11), Float64(0.0001)),
            //x为正数，靠近上整
            (floor(Float64(10.25)), Float64(10), Float64(0.0001)),
            //x为正数，靠近下整
            (floor(Float64(4.9665)), Float64(4), Float64(0.0001)),
            //x为正整数
            (floor(Float64(5)), Float64(5), Float64(0.0001)),
            //x为负整数
            (floor(Float64(-5)), Float64(-5), Float64(0.0001)),
            //特殊值0，预期结果正确
            (floor(Float64(-0)), Float64(0), Float64(0.0001)),
            (floor(Float64(0)), Float64(0), Float64(0.0001))
        ],
        description: "public func floor(x: float64): float64"
    )
    return 0
}
