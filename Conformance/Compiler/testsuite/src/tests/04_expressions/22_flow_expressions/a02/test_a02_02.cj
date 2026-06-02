
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_22_a02_02

  @Level:         1

  @Assertion:   4.22(2) The precedence of |> and ~> is the same, and is between || and assignment operator =. |> and ~>
                are both left-associative see the last section for more details.
  @Description: Checks that associativity of |> and ~>. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

func dec(x : Int64) { x - 1 }
func f1(x : Int64) { 1.0 }
func f2(x : Float64) { r'1' }
func f3(x : Rune) { "1" }

main() {
    Assert.equals(7, 10 |> dec |> dec |> dec)
    Assert.equals(10 |> dec |> dec |> dec, (((10 |> dec) |> dec) |> dec))

    Assert.equals(6, 10 |> (dec ~> dec ~> dec ~> dec))
    Assert.equals(10 |> (dec ~> dec ~> dec ~> dec), 10 |> (((dec ~> dec) ~> dec) ~> dec))

    Assert.equals("1", 10 |> f1 |> f2 |> f3)
    Assert.equals("1", ((10 |> f1) |> f2) |> f3)
    Assert.equals("1", 10 |> (f1 ~> f2 ~> f3))
    Assert.equals(10 |> (f1 ~> f2 ~> f3), 10 |> ((f1 ~> f2) ~> f3))
}

