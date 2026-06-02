// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %cmp_opt  -Woff unused %enableO2 %disableConstPropagation %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output

var globalVar: UInt8 = 1

@OverflowWrapping
func test3() {
    let a = 130 + globalVar
    return a + a
}

main() {
    let x2 = test3()
    0
}

// ASSERT: regex-not \[RangeAnalysis\] The value of Add at \[14,
// ASSERT: regex-not \[RangeAnalysis\] The value of Add at \[15,
