// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// The parameter synthesized for '~>' has a dedicated scope: operands still
// resolve user declarations (including one named 'compositionPara'), and
// multiple compositions in the same scope get distinct parameters.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f

func compositionPara(x: Int64): Int64 {
    x + 1
}

func f(x: Int64): Int64 {
    x + 1
}

func g(x: Int64): Int64 {
    x * 2
}

main() {
    let a = compositionPara ~> g
    let b = f ~> g
    let c = g ~> f
    println(a(1))
    println(b(1))
    println(c(1))
}

/* SCAN
4
4
3
*/
