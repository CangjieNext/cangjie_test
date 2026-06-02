/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a03_08

  @Level:         1

  @Assertion: 4.3(3) In above, if is the keyword and it is followed by an 
              expression in parentheses, then followed by a block (see Section
              4.15) and an optional else branch.
  @Description: Checks that `if` with expression in parantheses after this 
                followed by the else-block causes a compile error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single

*/

var i = 0

main() {
    if (i > 2) else {}
}
