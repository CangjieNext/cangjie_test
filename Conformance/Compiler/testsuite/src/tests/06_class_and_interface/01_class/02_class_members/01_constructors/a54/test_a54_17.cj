/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a54_17

  @Level:         1

  @Assertion: 6.1.2.1(54)
              After another constructor in the class or a superclass’s constructor is called,
              the instance member variables of the superclass can be accessed using super.f.

  @Description: Check that a public immutable instance variable of the superclass
                can not be used in the initial value of an instance variable

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class Parent {
    public let x = 1
}

class A <: Parent {
    let y = super.x
}

main() {
}