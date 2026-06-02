// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %enableO2 %debugCHIROpt %cmp_opt %disableConstPropagation %f -o %output 2>&1 | compare %f
// do not run the output here: it shall cause an endless loop

func foo() {
    1 << 1
}

main() {
    var a = 2
    while (a < 3) {
        let t1 = 2 < a
        a = 3
        let t2 = 2 < a
    }
    let x = a >= 3
    0
}

// ASSERT: scan [RangeAnalysis] The value of LT at [17,18] has been set to false
// ASSERT: scan [RangeAnalysis] The value of LT at [19,18] has been set to true
// ASSERT: regex-not \[RangePropagation\] The LT at \[17,
// ASSERT: regex-not \[RangePropagation\] The LT at \[19,
// ASSERT: regex-not \[RangePropagation\] The GE at \[21,
