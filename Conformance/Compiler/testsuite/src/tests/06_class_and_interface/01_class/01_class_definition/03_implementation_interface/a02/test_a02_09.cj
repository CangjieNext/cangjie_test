/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a02_09

  @Level:         1

  @Assertion: 6.1.1.3(2)
              The interfaces implemented by the class are declared by 
              <: I1 & I2 & ... & Ik after the class name or the superclass name if there is one.

  @Description: Check that the list of superinterfaces can not appear before the class keyword

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006128

*/

interface I1 {}
interface I2 {}

<: I1 & I2 class A {}

main() {
}
