
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_22_a01_01

  @Level:         1

  @Assertion:   4.22(1) Flow expressions are expressions that contain flow operators. There are two flow operators:
                infix operator |> (called pipeline) which indicates the data flow and infix operator ~> (called
                composition) which indicates the function combination.
  @Description: Checks compilation and execution of a program that uses flow expressions. 
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

    Assert.equals("a", s |> a)    
    Assert.equals("b", s |> b)
    Assert.equals("ab", s |> a |> b)
    Assert.equals("ab", b(s |> a))
    Assert.equals("ba", s |> b |> a)
    Assert.equals("ba", a(s |> b))

    Assert.equals("ab", s |> (a ~> b))
    Assert.equals("aba", s |> (a ~> b ~> a))
    Assert.equals("ab", (a ~> b)(s))
    Assert.equals("ba", s |> (b ~> a))
    Assert.equals("bab", s |> (b ~> a ~> b))
    Assert.equals("ba", (b ~> a)(s))

    Assert.equals("baba", s |> (b ~> a) |> (b ~> a))
    Assert.equals("abba", (a ~> b)(s) |> (b ~> a))
}

