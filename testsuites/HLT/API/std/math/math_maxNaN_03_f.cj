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
    var x_F641 = Float64(1.0)
    var y_F641 = Float64(8.0)
    CaseRunner<Bool>().runCasesTrue(
        [
            Float64.max(nan64, nan64).isNaN(),
            Float64.max(x_F641, nan64).isNaN(),
            Float64.max(nan64, y_F641).isNaN()
        ],
        description: "入参是nan"
    )
    CaseRunner<Float64>().runCases(
        [
            //正数和正数比较
            (Float64.max(Float64(5.698754), Float64(8.198754)), Float64(8.198754)),
            //顺序
            (Float64.max(Float64(8.198754), Float64(5.698754)), Float64(8.198754)),
            //相等的两个数返回较小值
            (Float64.max(Float64(8.198754), Float64(8.198754)), Float64(8.198754)),
            //负数和负数
            (Float64.max(Float64(-5.698754), Float64(-8.198754)), Float64(-5.698754)),
            //正数和负数
            (Float64.max(Float64(5.698754), Float64(-8.198754)), Float64(5.698754)),
            //0和一个数比较
            (Float64.max(Float64(0), Float64(8.198754)), Float64(8.198754)),
            (Float64.max(Float64(15), Float64(0)), Float64(15))
        ],
        description: "入参不是nan,inf"
    )
    CaseRunner<Float64>().runCases(
        [
            (Float64.max(inf64, Float64(5)), inf64, Float64(0.0001)),
            (Float64.max(Float64(5), inf64), inf64, Float64(0.0001)),
            (Float64.max(-inf64, Float64(5)), Float64(5), Float64(0.0001)),
            (Float64.max(Float64(5), -inf64), Float64(5), Float64(0.0001)),
            (Float64.max(inf64, inf64), inf64, Float64(0.0001)),
            (Float64.max(-inf64, inf64), inf64, Float64(0.0001))
        ],
        description: "入参不是inf"
    )
    return 0
}
