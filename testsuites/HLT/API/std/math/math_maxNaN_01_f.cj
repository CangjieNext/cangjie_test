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
    var x_F161 = Float16(1.0)
    var y_F161 = Float16(8.0)
    CaseRunner<Bool>().runCasesTrue(
        [
            Float16.max(nan16, nan16).isNaN(),
            Float16.max(x_F161, nan16).isNaN(),
            Float16.max(nan16, y_F161).isNaN()
        ],
        description: "入参存在nan"
    )
    CaseRunner<Float16>().runCases(
        [
            //正数和正数比较,与顺序无关
            (Float16.max(Float16(5.698754), Float16(8.198754)), Float16(8.198754)),
            //顺序
            (Float16.max(Float16(8.198754), Float16(5.698754)), Float16(8.198754)),
            //相等的两个数返回较小值
            (Float16.max(Float16(8.198754), Float16(8.198754)), Float16(8.198754)),
            //负数和负数
            (Float16.max(Float16(-5.698754), Float16(-8.198754)), Float16(-5.698754)),
            //正数和负数
            (Float16.max(Float16(5.698754), Float16(-8.198754)), Float16(5.698754)),
            //0和一个数比较
            (Float16.max(Float16(0), Float16(8.198754)), Float16(8.198754)),
            (Float16.max(Float16(15), Float16(0)), Float16(15))
        ],
        description: "入参非nan,inf"
    )
    CaseRunner<Float16>().runCases(
        [
            (Float16.max(inf16, Float16(5)), inf16, Float16(0.0001)),
            (Float16.max(Float16(5), inf16), inf16, Float16(0.0001)),
            (Float16.max(-inf16, Float16(5)), Float16(5), Float16(0.0001)),
            (Float16.max(Float16(5), -inf16), Float16(5), Float16(0.0001)),
            (Float16.max(inf16, inf16), inf16, Float16(0.0001)),
            (Float16.max(-inf16, inf16), inf16, Float16(0.0001))
        ],
        description: "入参存在inf"
    )
    return 0
}
