// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %cmp_opt %enableO2 %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output

func foo(c: Float64) {
    return c / 2.0
}

main() {
    let a = 3.7
    let b = foo(4.8889848398798)
    if (a == b) { // [true, false]
        print(a)
    } else if (a < b) { // [true, false]
        print(b)
    }

    return
}

// ASSERT: regex-not Assertion .* failed
// ASSERT: scan-not core dumped
// ASSERT: regex-not \[RangeAnalysis\].*\[17,9\]
// ASSERT: regex-not \[RangeAnalysis\].*\[19,16\]
// ASSERT: regex-not \[RangePropagation\].*\[17,9\]
// ASSERT: regex-not \[RangePropagation\].*\[19,16\]
