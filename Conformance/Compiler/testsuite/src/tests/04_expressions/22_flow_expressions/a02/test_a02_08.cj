
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_22_a02_08

  @Level:         1

  @Assertion:   4.22(2) The precedence of |> and ~> is the same, and is between || and assignment operator =. |> and ~>
                are both left-associative see the last section for more details.
  @Description: Checks that true x = y |> f, where f takes Unit, won't compile (|> is evaluated first).
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: ignore

*/

func f(x : Unit) { true }

main() {
    var v : Int64
    let e = (v = 1 |> f)
}

