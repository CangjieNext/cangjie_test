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
    var x_F321 = Float32(1.0)
    var y_F321 = Float32(8.0)
    CaseRunner<Bool>().runCasesTrue(
        [
            Float32.max(nan32, nan32).isNaN(),
            Float32.max(x_F321, nan32).isNaN(),
            Float32.max(nan32, y_F321).isNaN()
        ],
        description: "入参是nan"
    )
    CaseRunner<Float32>().runCases(
        [
            //正数和正数比较
            (Float32.max(Float32(5.698754), Float32(8.198754)), Float32(8.198754)),
            //顺序
            (Float32.max(Float32(8.198754), Float32(5.698754)), Float32(8.198754)),
            //相等的两个数返回较小值
            (Float32.max(Float32(8.198754), Float32(8.198754)), Float32(8.198754)),
            //负数和负数
            (Float32.max(Float32(-5.698754), Float32(-8.198754)), Float32(-5.698754)),
            //正数和负数
            (Float32.max(Float32(5.698754), Float32(-8.198754)), Float32(5.698754)),
            //0和一个数比较
            (Float32.max(Float32(0), Float32(8.198754)), Float32(8.198754)),
            (Float32.max(Float32(15), Float32(0)), Float32(15))
        ],
        description: "入参不是nan，inf"
    )
    CaseRunner<Float32>().runCases(
        [
            (Float32.max(inf32, Float32(5)), inf32, Float32(0.0001)),
            (Float32.max(Float32(5), inf32), inf32, Float32(0.0001)),
            (Float32.max(-inf32, Float32(5)), Float32(5), Float32(0.0001)),
            (Float32.max(Float32(5), -inf32), Float32(5), Float32(0.0001)),
            (Float32.max(inf32, inf32), inf32, Float32(0.0001)),
            (Float32.max(-inf32, inf32), inf32, Float32(0.0001))
        ],
        description: "入参是inf"
    )
    return 0
}
