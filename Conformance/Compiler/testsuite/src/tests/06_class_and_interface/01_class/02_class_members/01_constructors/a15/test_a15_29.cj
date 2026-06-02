/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a15_29

  @Level:         1

  @Assertion: 6.1.2.1(15)
              In the primary constructor, only instance member variable declarations can be written.

  @Description: Check that a var member variable named paremeter
                can not have the 'static' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006183

*/

class Test {
  Test(
    static var p!: Int64
  ) {}
}

main() {
}