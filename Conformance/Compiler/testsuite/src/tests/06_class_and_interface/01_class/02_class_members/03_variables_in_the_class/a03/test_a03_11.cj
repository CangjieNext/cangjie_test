/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a03_11

  @Level:         1

  @Assertion: 6.1.2.3(3)
              The initial value expression can use the previously declared instance member variables.

  @Description: Check that a mutable protected instance member variable can not use as an initial value
                a mutable protected instance variable declared after it

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/


class A {
    protected var a = b
    protected var b = 1
}

main() {
}
