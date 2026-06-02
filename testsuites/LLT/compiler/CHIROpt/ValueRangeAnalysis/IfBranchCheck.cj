// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %disableConstPropagation %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output

main() {
    var a = 3
    let f = 1.1
    if (f > 2.2) {
        a = 4
    } else {
        a = 2
    }

    let b = 3
    if (a >= 2) {
        let res1 = b == 3
    } else {
        let res2 = b == 4
    }

    if (a < 1) {
        let res1 = b == 5
    } else {
        let res2 = b == 3
    }

    0
}

// ASSERT: scan-not core dump
// ASSERT: regex-not \[RangeAnalysis\].*\[13,9\]
// ASSERT: scan [RangeAnalysis] The value of GE at [20,9] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [21,20] has been set to true
// ASSERT: scan [RangeAnalysis] The If Block at [20,5] has been replace to the True Block
// ASSERT: scan [RangeAnalysis] The value of LT at [26,9] has been set to false
// ASSERT: scan [RangeAnalysis] The If Block at [26,5] has been replace to the False Block
// ASSERT: scan [RangeAnalysis] The value of Equal at [29,20] has been set to true
// ASSERT: scan [RangePropagation] The terminator Branch at [20,5] has been optimised
// ASSERT: scan [RangePropagation] The terminator Branch at [26,5] has been optimised
