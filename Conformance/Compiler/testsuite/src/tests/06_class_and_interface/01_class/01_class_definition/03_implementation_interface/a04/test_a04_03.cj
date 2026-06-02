/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a04_03

  @Level:         1

  @Assertion: 6.1.1.3(4)
              If there is a superclass, interface names should be placed after the superclass name.

  @Description: Check that several interfaces can not precede the superclass name

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class A {}
interface I1 {}
interface I2 {}
interface I3 {}

class B <: I1 & I2 & I3 & A {}

main() {
}
