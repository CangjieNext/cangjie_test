
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_22_a02_03

  @Level:         1

  @Assertion:   4.22(2) The precedence of |> and ~> is the same, and is between || and assignment operator =. |> and ~>
                are both left-associative see the last section for more details.
  @Description: Checks that ~> and |> have the same precedence.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

func f(x : Int64) { 0 }
func g(x : (Int64) -> Int64) { 1 }
func h(x : Int64) { f }

main() {
    Assert.equals(1, f ~> f |> g)
    Assert.equals(0, (1 |> h ~> f)(123)) 
}

