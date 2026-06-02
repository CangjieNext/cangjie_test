// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %enableConstPropagation %cmp_opt %enableCompileDebug %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %output

let x = (1, 2)
var y = x[0]

let (a, b) = (x[1], y)

func foo() {
    var m1 = y
    var m2 = a
    var m3 = b
    if (x[0] == 1 && x[1] == 2 && y == 1 && a == 2 && b == 1) {
        0
    } else {
        1
    }
}

main() {
    foo()
}

// ASSERT: scan [ConstPropagation] The Field at [tuple02.cj,12,9] has been rewrited to a constant
// ASSERT: scan [ConstPropagation] The Field at [tuple02.cj,14,15] has been rewrited to a constant
// ASSERT: regex-not \[ConstPropagation\] The Load at [tuple02\.cj,17,.*] has been rewrited to a constant
// ASSERT: scan [ConstPropagation] The Load at [tuple02.cj,18,14] has been rewrited to a constant
// ASSERT: regex-not \[ConstPropagation\] The Load at [tuple02\.cj,19,.*] has been rewrited to a constant