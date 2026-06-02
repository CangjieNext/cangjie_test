/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a04_09

  @Level:         1

  @Assertion: 4.3(4)
              The else branch begins with the else keyword, followed by a new
              if expression or a block.
  @Description: Checks that if-else block cannot be followed by another `if`
                block.
  @Mode: compileonly
  @Negative: yes
  @Structure: single

*/

var i = 0
var j = 0

main() {
    if (i < 0) {
    } else {
    } if (j < 0) {
    }
}
