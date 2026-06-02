/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a02_04

  @Level:         1

  @Assertion: 6.1.2.3(2)
              In the class, instance member variables outside the primary constructor may have initial values.

  @Description: Check that a private mutable member variable defined in the primary constructor
                can not have an initial value and has to be defined in init constructors

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006232

*/

class A {
    A(private var x!: Int64 = 1) {}
    // x does not have an initial value and has to be defined inside init
    init() {}
}

main() {
}