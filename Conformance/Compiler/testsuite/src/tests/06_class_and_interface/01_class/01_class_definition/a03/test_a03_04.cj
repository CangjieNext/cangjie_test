/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a03_04

  @Level:         1

  @Assertion: 6.1.1(3)
              Classes can be only defined at the top level of a file.

  @Description: Check that a class can not be defined inside an if expression

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

func foo (x: Int32) {
  if (x > 0) {
    public class Klass {
      func bar() {}
    }
  }
}

main() {
}
