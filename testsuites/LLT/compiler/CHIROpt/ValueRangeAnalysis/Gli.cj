// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %disableConstPropagation %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output

func id(a: Int64) {
    a
}

let a = id(3)
let b = id(8)
let c = a + 9
let d = c + a
var e = id(10)
var f = id(18)
var g = e + 1
var h = g - f
let i1 = e - f

main() {
    let k1 = a
    var k2 = e
    let k3 = a + e

    let res1 = a > b
    let res2 = c < d
    let res3 = e == f // [true, false]
    let res4 = g != h // [true, false]
    let res5 = k1 < k2 // [true, false]
    let res6 = k3 > e - h // [true, false]
    let res7 = e % f == g / h // [true, false]
    let res8 = i1 == 3 // [true, false]

    return 0
}

// ASSERT: regex-not Assertion .* failed
// ASSERT: scan-not core dumped
// ASSERT: scan [RangePropagation] The GT at [29,16] has been rewrited to a constant
// ASSERT: scan [RangePropagation] The LT at [30,16] has been rewrited to a constant
