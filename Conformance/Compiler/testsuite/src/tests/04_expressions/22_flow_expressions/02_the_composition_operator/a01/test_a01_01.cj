
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_22_02_a01_01

  @Level:         1

  @Assertion:   4.22.2(1) A composition expression represents a combination of two single-parameter functions.
  @Description: Checks compilation and execution of a program that uses composition expressions. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func a(s : String) { s + "a" }

func b(s : String) { s + "b" }

main() {
    var s = ""

    Assert.equals("ab", (a ~> b)(s))
    Assert.equals("aba", (a ~> b ~> a)(s))
    Assert.equals("ac", (a ~> {s : String => s + "c" })(s))
    Assert.equals("ca", ({s : String => s + "c"} ~> a)(s))
    Assert.equals("cd", ({s : String => s + "c"} ~> {s : String => s + "d"})(s))

    Assert.isTrue((a ~> b) is (String) -> String)
    Assert.isTrue((a ~> b ~> a) is (String) -> String)
    Assert.isTrue((a ~> b ~> {s : String => s.size}) is (String) -> Int64)
}
