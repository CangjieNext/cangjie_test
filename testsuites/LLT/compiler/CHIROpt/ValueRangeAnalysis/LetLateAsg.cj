// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output

func foo() {
    1
}

main() {
    let a: Int64
    if (0 < foo()) {
        a = 3
    }
}

// ASSERT: scan-not core dump
// ASSERT: scan [RangeAnalysis] The value of LT at [16,9] has been set to true
// ASSERT: scan [RangeAnalysis] The If Block at [16,5] has been replace to the True Block
// ASSERT: scan [RangePropagation] The terminator Branch at [16,5] has been optimised
// ASSERT: scan [RangePropagation] The LT at [16,9] has been rewrited to a constant
