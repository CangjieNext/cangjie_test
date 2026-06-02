// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %f -o %output 2>&1 | compare %f
// analysis only, don't run the output file

func foo() {
    1 << 1
}

func a() {
    let m = foo()
    let g1 = if (m < m + 1) {
        1
    } else {
        2
    }

    let g2 = if (m == m - 1 + 1) {
        1
    } else {
        2
    }

    let res = g1 == g2
    return
}

main() {
    a()
    return
}

// ASSERT: regex-not Assertion .* failed
// ASSERT: regex-not core dumped
// ASSERT: scan [RangeAnalysis] The value of LT at [16,18] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [22,18] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [28,15] has been set to true
// ASSERT: scan [RangePropagation] The LT at [16,18] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The Equal at [22,18] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The Equal at [28,15] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The terminator Branch at [16,14] has been optimised
// ASSERT: scan [RangePropagation] The terminator Branch at [22,14] has been optimised
