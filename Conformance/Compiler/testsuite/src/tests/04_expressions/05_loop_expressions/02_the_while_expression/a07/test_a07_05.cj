/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a07_05

  @Level:         1

  @Assertion: 4.5.2(7) The pattern after let supports constant pattern, wildcard pattern, variable binding
              pattern, Tuple pattern, and enum pattern.
  @Description: Check some tests with tuple pattern
  @Mode: run
  @Negative: no
  @Issue: 6473
  @Comment: Test may need to be fixed when issue is resolved

*/

import utils.assert.Assert

var msg: String = ""

func visit(id: String) { msg = id }
func check(id: String) { Assert.equals(msg, id); msg = "" }


struct S { }
class C { }
enum E { Foo | Bar(Int32) }
func f () {}

main() {
    while (let ((), x) <- ((), ())) {
        visit("1")
        Assert.isTrue(x is Unit)
        break
    }
    check("1")

    while (let (x, _) <- ((), ())) {
        visit("2")
        Assert.isTrue(x is Unit)
        break
    }
    check("2")

    while (let ((), ()) <- ((), ())) {
        visit("3")
        break
    }
    check("3")

    while (let (_, _) <- ((), ())) {
        visit("4")
        break
    }
    check("4")

    while (let ((a, b), (c, d), (e, f)) <- ((f, f), (S(), C()), (Foo, Bar(2)))) {
        visit("5")
        Assert.isTrue(a is () -> Unit)
        Assert.isTrue(b is () -> Unit)
        Assert.isTrue(c is S)
        Assert.isTrue(d is C)
        Assert.isTrue(e is E)
        Assert.isTrue(f is E)
        break
    }
    check("5")
}
