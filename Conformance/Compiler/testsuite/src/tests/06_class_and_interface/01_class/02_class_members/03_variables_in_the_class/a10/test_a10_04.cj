/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a10_04

  @Level:         1

  @Assertion: 6.1.2.3(10)
              Private variables cannot be accessed outside of a class through a class instance
              and cannot be inherited.

  @Description: Check that a private mutable static variable is inaccessible outside its class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006236

*/

class A {
    static private var x = 1
}

main() {
    A.x
}