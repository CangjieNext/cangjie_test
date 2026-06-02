// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %cmp_opt %f %enableO2 -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output
// testing asg with global/fields

class B {
    var a = 3
    var d3 = false
}

struct A {
    var a = 3
    var b28 = B()
}

var a2 = A()
var b2 = B()

main() {
    var sh5 = A()
    let sh1 = B()
    var sh6 = B()
    a2.a = 8
    b2.a = 19
    sh5.a = 108

    sh1.a = 0x111aaa
    sh6.a = 0x111aaa
    let x1 = sh1.a == sh6.a // [true, false]
    sh6 = B()
    let x2 = sh1.a == sh6.a // [true, false]

    return
}

// ASSERT: regex-not Assertion .* failed
// ASSERT: scan-not core dumped
// ASSERT: regex-not \[RangeAnalysis\].*\[34,14\]
// ASSERT: regex-not \[RangeAnalysis\].*\[36,14\]
