/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a06_02

  @Level:         1

  @Assertion: 4.5.2(6) The while-let expression first evaluates the expression after <-
              (the type of the expression can be any type), and if the value of the expression
              matches the pattern after let, it executes the block after it, then recalculates
              the value of the expression and matches it again and determines whether to execute
              the loop again; if the match fails, it terminates the current while loop.
  @Description: Check that expression is evaluated before loop body executes for all kinds of patterns
  @Mode: run
  @Negative: no
  @Issue: 6473
  @Comment: Test may need to be fixed when issue is resolved

*/

import utils.assert.Assert

var msg: String = ""

func visit(id: String) { msg = id }
func check(id: String) { Assert.equals(msg, id); msg = "" }
func fail(id: String)  { Assert.fail(reason: "Should not reach here: ${id}") }

enum E { Foo(Bool) | Bar(Bool) }

main() {
    func f1() { visit("constant_no_match"); 1 }
    while (let 100 <- f1()) { fail("constant_no_match") }
    check("constant_no_match")

    func f2() { visit("constant_match"); 1 }
    while (let 1 <- f2()) { break }
    check("constant_match")

    func f3() { visit("wildcard_match"); Some(123) }
    while (let _ <- f3()) { break }
    check("wildcard_match")

    func f4() { visit("variable_match"); Some("string") }
    while (let x <- f4()) { break }
    check("variable_match")

    func f5() { visit("tuple_no_match"); (2, "Q") }
    while (let (1, y) <- f5()) { fail("tuple_no_match") }
    check("tuple_no_match")

    func f6() { visit("tuple_match"); (2, "Q") }
    while (let (2, x) <- f6()) { break }
    check("tuple_match")

    func f7() { visit("enum_no_match"); Foo(true) }
    while (let Bar(x) <- f7()) { fail("enum_no_match") }
    check("enum_no_match")

    func f8() { visit("enum_match"); Foo(true) }
    while (let Foo(x) <- f8()) { break }
    check("enum_match")
}
