/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a07_04

  @Level:         1

  @Assertion: 4.5.2(7) The pattern after let supports constant pattern, wildcard pattern, variable binding
              pattern, Tuple pattern, and enum pattern.
  @Description: Check some tests with variable pattern
  @Mode: run
  @Negative: no
  @Issue: 6473

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
    while (let x <- ()) {
        visit("1")
        Assert.isTrue(x is Unit)
        break
    }
    check("1")

    while (let x <- ((), ())) {
        visit("2")
        Assert.isTrue(x[0] is Unit)
        Assert.isTrue(x[1] is Unit)
        break
    }
    check("2")

    while (let x <- (f, [Foo, Bar(2)])) {
        visit("3")
        Assert.isTrue(x[0] is () -> Unit)
        Assert.isTrue(x[1][0] is E)
        Assert.isTrue(x[1][1] is E)
        break
    }
    check("3")

    while (let x <- { x: Bool, y: Bool => x && y} ) {
        visit("4")
        Assert.isTrue(x is (Bool, Bool) -> Bool)
        break
    }
    check("4")

    while (let x <- S()) {
        visit("5")
        Assert.isTrue(x is S)
        break
    }
    check("5")

    while (let x <- C()) {
        visit("6")
        Assert.isTrue(x is C)
        break
    }
    check("6")
}
