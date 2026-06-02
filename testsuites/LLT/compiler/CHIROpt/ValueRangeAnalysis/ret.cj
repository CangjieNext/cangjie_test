// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %enableO2 %debugCHIROpt %cmp_opt %f --int-overflow=throwing -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output

func foo() {
    1 << 1
}

func a(): Int64 {
    if (foo() == 4) {
        return 5
    } else {
        return 8
    }
    return 10
}

main() {
    print(a())
    return
}

// ASSERT: scan [RangeAnalysis] The value of Equal at [15,9] has been set to false
// ASSERT: scan [RangeAnalysis] The If Block at [15,5] has been replace to the False Block
// ASSERT: scan [RangePropagation] The terminator Branch at [15,5] has been optimised
