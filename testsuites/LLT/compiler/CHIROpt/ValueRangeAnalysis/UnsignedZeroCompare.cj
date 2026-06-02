// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %cmp_opt %f %enableO2 %disableConstPropagation -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output 10000

main() {
    let i: UInt64 = 1 >> 1
    let x1 = i < 0
    let x2 = i >= 0
    let x3 = i > 0
    let x4 = i <= 0
    let x5 = i > 1
    0
}

// ASSERT: scan [RangeAnalysis] The value of LT at [12,14] has been set to false
// ASSERT: scan [RangeAnalysis] The value of GE at [13,14] has been set to true
// ASSERT: regex-not \[RangeAnalysis\].*\[14,14\]
// ASSERT: regex-not \[RangeAnalysis\].*\[15,14\]
// ASSERT: regex-not \[RangeAnalysis\].*\[16,14\]
