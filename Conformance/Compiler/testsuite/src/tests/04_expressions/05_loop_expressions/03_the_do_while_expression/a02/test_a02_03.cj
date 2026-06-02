/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_03_a02_03

  @Level:         1

  @Assertion: 4.5.3(2) The difference between a while expression and a do-while expression is the
              loop body in a while expression may not be evaluated (when the expression is initially false),
              whereas the loop body in a do-while expression is at least evaluated once, i.e., block is
              evaluated before evaluating the expression written after the keyword while.
  @Description: Check that condition expression can not refer to the local variable of block
  @Mode: compileonly
  @Negative: yes

*/

main() {
    do {
        let x = 1
    } while (x == 1)
}
