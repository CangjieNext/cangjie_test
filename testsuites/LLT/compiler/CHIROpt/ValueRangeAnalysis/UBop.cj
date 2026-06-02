// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %cmp_opt %f %enableO2 -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output
// testing unary/binary/field operation with global/fields

class B {
    let a = 3
    let d3 = false
}

struct A {
    let a = 3
    let d7 = true
    let b28 = B()
}

let a1 = A()
var a2 = A()
let b1 = B()
var b2 = B()
let d1 = true
var d2 = false

main() {
    let x1 = a1.a > a2.a
    let x2 = b1.a > b2.a
    let x3 = b1.a * a2.b28.a
    let x4 = b2.a << a1.b28.a

    let x5 = a1.d7 == d1
    let x6 = a2.d7 != d2
    let x7 = b2.d3 == !d1
    let x8 = a2.b28.d3 == !d2

    return
}

// ASSERT: regex-not Assertion .* failed
// ASSERT: regex-not \[RangePropagation\].*\[24,14\]
// ASSERT: regex-not \[RangePropagation\].*\[25,14\]
// ASSERT: regex-not \[RangePropagation\].*\[26,14\]
// ASSERT: regex-not \[RangePropagation\].*\[27,14\]
// ASSERT: regex-not \[RangePropagation\].*\[29,14\]
// ASSERT: regex-not \[RangePropagation\].*\[30,14\]
// ASSERT: regex-not \[RangePropagation\].*\[31,14\]
// ASSERT: regex-not \[RangePropagation\].*\[32,14\]

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

