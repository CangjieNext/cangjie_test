// (DEBUG_OPTION)EXEC:%compiler %enableO2 %debugCHIROpt %disableConstPropagation %f --int-overflow=throwing -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output

func foo() {
    1 << 1
}

main() {
    var a = foo()
    var b = a - 2
    let res0 = a <= b // false
    let res1 = a > b // true
    let res2 = a != b // true

    a = a + 1 // 1
    b = a + 3 // 3
    let res3 = a < b // true
    let res4 = a > b // false
    let res5 = a == b // false

    return 0
}

// ASSERT: scan [RangeAnalysis] The value of LE at [11,16] has been set to false
// ASSERT: scan [RangeAnalysis] The value of GT at [12,16] has been set to true
// ASSERT: scan [RangeAnalysis] The value of NotEqual at [13,16] has been set to true
// ASSERT: scan [RangeAnalysis] The value of LT at [17,16] has been set to true
// ASSERT: scan [RangeAnalysis] The value of GT at [18,16] has been set to false
// ASSERT: scan [RangeAnalysis] The value of Equal at [19,16] has been set to false

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
