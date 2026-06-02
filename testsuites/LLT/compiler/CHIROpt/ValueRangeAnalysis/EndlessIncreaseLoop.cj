// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %enableO2 %debugCHIROpt %cmp_opt %disableConstPropagation %f -o %output 2>&1 | compare %f

func foo() {
    1 << 1
}

main() {
    var a = 2
    var b = 3
    while (a < 1000) {
        let t1 = 2 < a
        a = a + 1
        let t2 = 2 < a
    }
    let x1 = a >= 3
    let x2 = b >= 2
    0
}

// ASSERT: regex-not \[RangeAnalysis\] The value of GE at \[21,13\]
// ASSERT: regex-not \[RangeAnalysis\].*\[22,13\]
// ASSERT: regex-not \[RangePropagation\].*\[21,13\]
// ASSERT: regex-not \[RangePropagation\].*\[22,13\]
