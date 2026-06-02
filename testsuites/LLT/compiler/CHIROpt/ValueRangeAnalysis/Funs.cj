// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %enableO2 %disableConstPropagation %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output

func a() {
    var a = 3
    let x1 = a > 2
}

func b() {
    var a = 3
    let x2 = a > 2
}

main() {
    a()
    b()
}

// ASSERT: scan [RangeAnalysis] The value of GT at [17,14] has been set to true
// ASSERT: scan [RangeAnalysis] The value of GT at [12,14] has been set to true
// ASSERT: scan [RangePropagation] The GT at [12,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The GT at [17,14] has been rewrited to a constant
