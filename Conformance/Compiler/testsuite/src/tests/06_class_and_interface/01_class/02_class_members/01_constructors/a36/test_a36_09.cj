/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a36_09

  @Level:         1

  @Assertion: 6.1.2.1(36)
              The return type cannot be explicitly defined for the constructor,
              and the constructor must have a function body

  @Description: Check that an init constructor with the 'private' modifier 
                can not omit the body

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  private init()
}

main() {
}