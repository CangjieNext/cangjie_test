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
    let a = 3
    var b = -1
    let c = a
    b = c + 1
    let f1 = a <= c
    let f2 = b + c == 7
    let f3 = 100 < c + c
    let f4 = 100 <= c + c

    let g1 = foo()
    let g2 = g1 - 2
    let f5 = g2 <= g1 // true
    let f6 = a <= g2 // <t,f>

    let u2 = foo()
    let u3 = u2 + 1
    let x1 = u3 <= u2
    let x2 = u3 < u2
    let x3 = u3 == u2
    let x4 = u2 == u3
    let x5 = u2 < u3
    let x6 = u2 <= u3

    let x7 = u2 - 1 <= u2 + 1
    let x8 = u2 + 3 != u2 - 5
    let x9 = u2 - 4 >= u2 - 3
    let x10 = u2 + 7 == u3
    return 0
}

// ASSERT: scan [RangeAnalysis] The value of LE at [19,14] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [20,14] has been set to true
// ASSERT: scan [RangeAnalysis] The value of LT at [21,14] has been set to false
// ASSERT: scan [RangeAnalysis] The value of LE at [22,14] has been set to false
// ASSERT: scan [RangeAnalysis] The value of LE at [26,14] has been set to true
// ASSERT: regex-not \[RangeAnalysis\].*\[27,14\]
// ASSERT: scan [RangeAnalysis] The value of LE at [31,14] has been set to false
// ASSERT: scan [RangeAnalysis] The value of LT at [32,14] has been set to false
// ASSERT: scan [RangeAnalysis] The value of Equal at [33,14] has been set to false
// ASSERT: scan [RangeAnalysis] The value of Equal at [34,14] has been set to false
// ASSERT: scan [RangeAnalysis] The value of LT at [35,14] has been set to true
// ASSERT: scan [RangeAnalysis] The value of LE at [36,14] has been set to true
// ASSERT: scan [RangeAnalysis] The value of LE at [38,14] has been set to true
// ASSERT: scan [RangeAnalysis] The value of NotEqual at [39,14] has been set to true
// ASSERT: scan [RangeAnalysis] The value of GE at [40,14] has been set to false
// ASSERT: scan [RangeAnalysis] The value of Equal at [41,15] has been set to false
// ASSERT: scan [RangePropagation] The LE at [19,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The Equal at [20,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The LT at [21,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The LE at [22,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The LE at [26,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The LE at [31,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The LT at [32,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The Equal at [33,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The Equal at [34,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The LT at [35,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The LE at [36,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The LE at [38,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The NotEqual at [39,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The GE at [40,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The Equal at [41,15] has been rewrited to a constant
