// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %enableO2 %disableConstPropagation %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output

func foo() {
    1 << 1
}

main() {
    let a = foo()
    var c = 1
    if (a > 0) {
        c = 2
    } else {
        c = 3
    }

    let x = c == 3
    let x1 = c <= 3
    let x2 = c >= 2
}

// ASSERT: regex-not \[RangeAnalysis\].*\[17,9\]
// ASSERT: regex-not \[RangeAnalysis\].*\[23,13\]
// ASSERT: scan [RangeAnalysis] The value of LE at [24,14] has been set to true
// ASSERT: scan [RangeAnalysis] The value of GE at [25,14] has been set to true
// ASSERT: scan [RangePropagation] The LE at [24,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The GE at [25,14] has been rewrited to a constant
