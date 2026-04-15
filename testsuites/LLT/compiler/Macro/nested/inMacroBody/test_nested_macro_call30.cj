// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: testMacro.cj test_macro_run2.cj %f.expect
// EXEC: %compiler testMacro.cj %cmp_macro
// EXEC: %compiler %cmp_macro %f
// EXEC: %run_macro %compiler %cmp_opt test_macro_run2.cj %macro_debug -o %output
// EXEC: %diff test_macro_run2.cj.macrocall %f.expect

macro package define_b

import define_a.*
import std.ast.*

func fA() {
    @testa var a = 1
    0
}

public macro testb(attr: Tokens) {
    @testa var a = 1
    @testa var aa = 1
    @testaa var aaa = 1
    @testaaa var aaaa = 1

    @testaaa
    func innerF() {
        0
    }
    innerF()

    @testAttr2[1]
    func inner2F() {
        0
    }
    inner2F()

    let ab = @testa(0)
    let aab = @testa(0)
    let aaab = @testa(0)
    let bb = @testaa(0)
    let bc = @testaaa(quote(0))

    let at = @testAttr[1+](0)
    let att = @testAttr[1](+0)
    @testAttr2[1] var attar = 1
    @testAttr2[1] var bttr = 1
    @testAttr2[1] var cttr = 1

    fA()
    attr
}

public macro testbb(attr: Tokens, input: Tokens) {
    @testa var aa = 1
    @testaa var aaa = 1
    @testaaa var aaaa = 1

    @testaaa
    func innerF() {
        0
    }

    @testAttr2[1]
    func inner2F() {
        0
    }

    let ab = @testa(0)
    let aab = @testa(0)
    let aaab = @testa(0)
    let bb = @testaa(0)
    let bc = @testaaa(quote(0))

    let at = @testAttr[1+](0)
    let att = @testAttr[1](+0)
    @testAttr2[1] var attar = 1
    @testAttr2[1] var bttr = 1
    @testAttr2[1] var cttr = 1
    fA()
    attr + input
}
