/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_14_a07_04

  @Level:         1

  @Assertion: 4.14(7) For the expression expr++ (or expr--), the following is specified:

              2. Since expr++ (or expr--) is syntactic sugar of expr += 1 (or expr -= 1), the expr must also be
              assignable.

  @Description: Check that ++ can not be applied to non-assignable expression (tuple element).

  @Mode: compileonly

  @Negative: yes

*/

main() {
    let t = (1, 2, 3)
    t[1]++
    return
}

