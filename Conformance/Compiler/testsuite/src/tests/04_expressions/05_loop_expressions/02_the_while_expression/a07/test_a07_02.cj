/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a07_02

  @Level:         1

  @Assertion: 4.5.2(7) The pattern after let supports constant pattern, wildcard pattern, variable binding
              pattern, Tuple pattern, and enum pattern.
  @Description: Check some tests with constant pattern
  @Mode: run
  @Negative: no
  @Issue: 6473

*/

import utils.assert.Assert

var msg: String = ""

func visit(id: String) { msg = id }
func check(id: String) { Assert.equals(msg, id); msg = "" }
func fail(id: String)  { Assert.fail(reason: "Should not reach here: ${id}") }


main() {
    while (let () <- ()) { visit("match_unit"); break }
    check("match_unit")

    while (let true <- true) { visit("match_bool"); break }
    check("match_bool")

    while (let false <- true) { fail("no_match_bool") }

    while (let "String" <- "String") { visit("match_string"); break }
    check("match_string")

    while (let "nope" <- "String") { fail("no_match_string") }

    while (let 1 <- 1) { visit("match_int"); break }
    check("match_int")

    while (let 2 <- 1) { fail("no_match_int") }

    while (let 1.1 <- 1.1) { visit("match_float"); break }
    check("match_float")

    while (let 2.1 <- 1.1) { fail("no_match_float") }

    while (let 'A' <- 'A') { visit("match_char"); break }
    check("match_char")

    while (let 'Z' <- 'A') { fail("no_match_char") }

    while (let b'A' <- b'A') { visit("match_char_byte"); break }
    check("match_char_byte")

    while (let b'Z' <- b'A') { fail("no_match_char_byte") }
}
