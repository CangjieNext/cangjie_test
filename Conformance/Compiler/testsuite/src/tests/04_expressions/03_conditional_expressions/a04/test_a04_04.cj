/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a04_04

  @Level:         1

  @Assertion: 4.3(4)
              The else branch begins with the else keyword, followed by a new
              if expression or a block.
  @Description: Checks that `else` keyword cannot be followed by the arythmetic 
                expression.
  @Mode: compileonly
  @Negative: yes
  @Structure: single

*/

var i = 0

main() {
    if (i > 0) {
    } else i++
}
