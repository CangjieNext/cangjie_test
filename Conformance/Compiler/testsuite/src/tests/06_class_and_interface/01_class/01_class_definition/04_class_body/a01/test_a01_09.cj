/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a01_09

  @Level:         1

  @Assertion: 6.1.1.4(1)
              The class body is consisted of zero or more member declarations which are enclosed in a pair of curly brackets.

  @Description: Check that the class body can not be enclosed in square brakets

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A [
  let a = 1
  let b = 2
  open func f() {
    return a + b
  }
]

main() {
}
