// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %disableConstPropagation %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output

var globalVar: UInt8 = 1

@OverflowSaturating
func test(a: Int8, b: Int8) {
    return a / b // inline to [29, 20]
}

@OverflowSaturating
func test2() {
    return (99 + globalVar) * 3
}

@OverflowSaturating
func test3() {
    let a = 130 + globalVar
    return a + a
}

main() {
    let x1 = Int64(test(-128, -1) - 127)
    let x2 = test2()
    let x3 = test3()
}

// ASSERT: scan [RangeAnalysis] The value of Div at [29,20] has been set to 127
// ASSERT: scan [RangeAnalysis] The value of Mul at [19,12] has been set to 255
// ASSERT: scan [RangeAnalysis] The value of Add at [25,12] has been set to 255
