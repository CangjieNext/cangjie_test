/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a02_17

  @Level:         1

  @Assertion: 6.1.1.3(2)
              The interfaces implemented by the class are declared by 
              <: I1 & I2 & ... & Ik after the class name or the superclass name if there is one.

  @Description: Check that it's illegal for the interface list to be empty after <:

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006128

*/

class A <: {}

main() {
}

