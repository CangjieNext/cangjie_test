// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %disableConstPropagation %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output

func foo() {
    var a = 1
    var b = 1
    var c = 1
    while (true) {
        try {
            a = 2
            a = 1
            break
        } catch (_) {
            var c1 = a
            var c2 = b
            b = 2
        } finally {
            var f1 = a
            a = 1
        }
    }

    let x1 = a > b
    let x2 = b == c
    let x3 = a <= c
    println("${a} ${b} ${c}")
}

func foo2() {
    var a = 1
    while (true) {
        try {
            a = 2
            return a
        } finally {
            a = 3
            break
        }
    }
    let x4 = a == 2
    return 1
}

main() {
    foo()
    foo2()
    return
}

// ASSERT: scan-not core dump
// ASSERT: scan [RangeAnalysis] The value of GT at [23,14] has been set to false
// ASSERT: scan [RangeAnalysis] The value of Equal at [24,14] has been set to true
// ASSERT: scan [RangeAnalysis] The value of LE at [25,14] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [40,14] has been set to false
// ASSERT: scan [RangePropagation] The GT at [23,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The Equal at [24,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The LE at [25,14] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The Equal at [40,14] has been rewrited to a constant

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
