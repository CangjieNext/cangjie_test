// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %f -o %output 2>&1 | compare %f

class A {
    var a: Int32 = 3
}

func a() {
    var a = 3
    var res = 0
    if (A().a < 4) { // [true, false]
        a = 4
    } else {
        a = 5
    }

    if (a >= 0) {
        let b = UInt64(-a)
        let x1 = b >= 0
        res = 2
    } else {
        let c = UInt64(0 - a)
        let x2 = c >= 0
        res = 3
    }
    return res
}

main() {
    return a()
}

// ASSERT: regex-not \[RangeAnalysis\].*\[16,9\]
// ASSERT: scan [RangeAnalysis] The value of GE at [22,9] has been set to true
// ASSERT: scan [RangeAnalysis] The If Block at [22,5] has been replace to the True Block
// ASSERT: scan [RangeAnalysis] The value of GE at [24,18] has been set to true
// ASSERT: scan-not [RangeAnalysis] The value of GE at [28,18] has been set to true
// ASSERT: scan [RangePropagation] The terminator Branch at [22,5] has been optimised
// ASSERT: scan [RangePropagation] The GE at [22,9] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The GE at [24,18] has been rewrited to a constant
