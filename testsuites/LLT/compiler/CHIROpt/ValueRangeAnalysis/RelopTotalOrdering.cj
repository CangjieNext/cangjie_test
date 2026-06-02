// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %enableO2 %debugCHIROpt %disableConstPropagation %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output

main() {
    let a1 = 3
    let a2 = -10
    let a3 = 0
    let a4 = a2

    let b1 = a1 * a2 // -30
    let b2 = a2 * a4 // 100
    let b3 = a3 / a4 // 0

    if (b2 < b1){ // false
        b2 <= b1 // parent disabled, no analysis here
    } else {
        let b4 = b2 - b1 // 130
    }
    0
}

// ASSERT: scan [RangeAnalysis] The value of Mul at [16,14] has been set to -30
// ASSERT: scan [RangeAnalysis] The value of Mul at [17,14] has been set to 100
// ASSERT: scan [RangeAnalysis] The value of Div at [18,14] has been set to 0
// ASSERT: scan [RangeAnalysis] The value of LT at [20,9] has been set to false
// ASSERT: scan [RangeAnalysis] The If Block at [20,5] has been replace to the False Block
// ASSERT: scan [RangeAnalysis] The value of Sub at [23,18] has been set to 130
// ASSERT: scan [RangePropagation] The terminator Branch at [20,5] has been optimised
