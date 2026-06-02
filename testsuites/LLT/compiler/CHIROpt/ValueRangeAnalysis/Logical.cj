// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %disableConstPropagation %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output

func foo() {
    1 << 1
}

main() {
    let a = foo()
    var b: Bool = false
    if (a > 0) {
        b = true
    } else {
        b = false
    }
    let c: Bool = 1 == 1
    let d: Bool = c || b
    let e: Bool = 1 == 0
    let f: Bool = e && b
    0
}

// ASSERT: scan [RangePropagation] The Load at [23,19] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The Load at [25,19] has been rewrited to a constant
