/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a03_56

  @Level:         1

  @Assertion: 6.1.2.3(3)
              The initial value expression can use the previously declared instance member variables.

  @Description: Check that an immutable private instance member variable can not use as an initial value
                an immutable private instance variable declared after it

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/


class A {
    private let a = b
    private let b = 1
}

main() {
}
