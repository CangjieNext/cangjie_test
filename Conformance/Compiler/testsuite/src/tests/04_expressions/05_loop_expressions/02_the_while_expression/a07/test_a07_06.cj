/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a07_06

  @Level:         1

  @Assertion: 4.5.2(7) The pattern after let supports constant pattern, wildcard pattern, variable binding
              pattern, Tuple pattern, and enum pattern.
  @Description: Check some tests with enum pattern
  @Mode: run
  @Negative: no
  @Issue: 6473

*/

import utils.assert.Assert

var msg: String = ""

func visit(id: String) { msg = id }
func check(id: String) { Assert.equals(msg, id); msg = "" }
func fail(id: String)  { Assert.fail(reason: "Should not reach here: ${id}") }

enum E { Foo(Int32, Bool) | Bar }

main() {
    var e1 = Bar
    while (let Foo(x, y) <- e1) {
        fail("1")
    }

    var e2 = Foo(123, true)
    while (let Foo(x, _) <- e2) {
        visit("2")
        break
    }
    check("2")

    var e3 = Foo(123, true)
    while (let Foo(x, false) <- e3) {
        fail("3")
    }

    func enumFunc (i: Int32): E {
        if (i < 5) { Foo(i, true) } else { Bar }
    }
    var e4 = Foo(0, false)
    while (let Foo(i, _) <- e4) {
        visit("4")
        e4 = enumFunc(i + 1)
    }
}
