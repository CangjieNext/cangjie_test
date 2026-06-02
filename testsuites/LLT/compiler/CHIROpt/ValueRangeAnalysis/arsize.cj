// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %cmp_opt %f %enableO2 -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output 10000

@OverflowWrapping
func foo(a: Array<String>) {
    // array.size >= 0
    // cast to UInt with same width does not lose this info
    if (a.size < 0 && UInt64(a.size) < 0) {
        throw Exception()
    }
}

main() {
    foo()
}

// ASSERT: regex-not \[RangeAnalysis\].*\[14,9\]
// ASSERT: scan [RangeAnalysis] The value of LT at [14,23] has been set to false
// ASSERT: scan [RangePropagation] The Load at [14,9] has been rewrited to a constant
