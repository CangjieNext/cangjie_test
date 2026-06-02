// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %disableConstPropagation %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output

main() {
    var a1 = 1
    var a2 = a1
    a1 = 18 + a2
    let x1 = a2 == a1
    0
}

// ASSERT: scan [RangeAnalysis] The value of Equal at [14,14] has been set to false
