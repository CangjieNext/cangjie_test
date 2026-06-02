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
            //正数和正数比较
            (max(Float16(5.698754), Float16(8.198754)), Float16(8.198754)),
            //顺序
            (max(Float16(8.198754), Float16(5.698754)), Float16(8.198754)),
            //相等的两个数返回较小值
            (max(Float16(8.198754), Float16(8.198754)), Float16(8.198754)),
            //负数和负数
            (max(Float16(-5.698754), Float16(-8.198754)), Float16(-5.698754)),
            //正数和负数
            (max(Float16(5.698754), Float16(-8.198754)), Float16(5.698754)),
            //0和一个数比较
            (max(Float16(0), Float16(8.198754)), Float16(8.198754)),
            (max(Float16(15), Float16(0)), Float16(15))
        ],
        description: "public func max(a: Float16, b: Float16): Float16"
    )
    CaseRunner<Float32>().runCases(
        [
            //正数和正数比较,与顺序无关
            (max(Float32(5.698754), Float32(8.198754)), Float32(8.198754)),
            //顺序
            (max(Float32(8.198754), Float32(5.698754)), Float32(8.198754)),
            //相等的两个数返回较小值
            (max(Float32(8.198754), Float32(8.198754)), Float32(8.198754)),
            //负数和负数
            (max(Float32(-5.698754), Float32(-8.198754)), Float32(-5.698754)),
            //正数和负数
            (max(Float32(5.698754), Float32(-8.198754)), Float32(5.698754)),
            //0和一个数比较
            (max(Float32(0), Float32(8.198754)), Float32(8.198754)),
            (max(Float32(15), Float32(0)), Float32(15))
        ],
        description: "public func max(a: Float32, b: Float32): Float32"
    )
    CaseRunner<Float64>().runCases(
        [
            //正数和正数比较
            (max(Float64(5.698754), Float64(8.198754)), Float64(8.198754)),
            //顺序
            (max(Float64(8.198754), Float64(5.698754)), Float64(8.198754)),
            //相等的两个数返回较小值
            (max(Float64(8.198754), Float64(8.198754)), Float64(8.198754)),
            //负数和负数
            (max(Float64(-5.698754), Float64(-8.198754)), Float64(-5.698754)),
            //正数和负数
            (max(Float64(5.698754), Float64(-8.198754)), Float64(5.698754)),
            //0和一个数比较
            (max(Float64(0), Float64(8.198754)), Float64(8.198754)),
            (max(Float64(15), Float64(0)), Float64(15))
        ],
        description: "public func max(a: Float64, b: Float64): Float64"
    )
    return 0
}
