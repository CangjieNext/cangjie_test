
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_a08_04

  @Level:         1

  @Assertion:   4.7(8) however, there is no similar rules for throw.
  @Description: Checks that throw is allowed inside the struct and outside the function.
  @Mode: run
  @Negative: yes
  @Structure: single
  @CompileWarning: ignore
  @Issue: 6498

*/

struct S {
    var n = throw Exception()
}

main() {
  let s = S()
}
