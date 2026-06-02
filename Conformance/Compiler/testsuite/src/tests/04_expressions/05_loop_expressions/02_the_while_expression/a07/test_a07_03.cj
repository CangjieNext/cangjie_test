/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a07_03

  @Level:         1

  @Assertion: 4.5.2(7) The pattern after let supports constant pattern, wildcard pattern, variable binding
              pattern, Tuple pattern, and enum pattern.
  @Description: Check some tests with wildcard pattern
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
    while (let _ <- ()) { visit("1"); break }
    check("1")

    while (let _ <- ((), ())) { visit("2"); break }
    check("2")

    while (let _ <- (f, Some(123), [Foo, Bar(2)])) { visit("3"); break }
    check("3")

    while (let _ <- { x: Bool, y: Bool => x && y} ) { visit("4"); break }
    check("4")

    while (let _ <- S()) { visit("5"); break }
    check("5")

    while (let _ <- C()) { visit("6"); break }
    check("6")
}
