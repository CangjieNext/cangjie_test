/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a28_03

  @Level:         1

  @Assertion: 2.1.10.2(28)
              A struct can define one primary constructor.

  @Description: Check that a struct can not define two primary constructors
                without parameters and with different modifiers

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

struct A {
    public A() {}
    private A() {}
}

main() {
}

