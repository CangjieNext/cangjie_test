/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a04_32

  @Level:         1

  @Assertion: 6.1.2.3(4)
              In this case, the execution sequence of the variable initialization
              is before the call of the super class’s constructor,
              it is prohibited to use qualified names with super
              to access the member variables of the superclass
              in the initial value expression of the instance member variables.

  @Description: Check that a mutable instance member variable can not use as an initial value
                an immutable private instance variable of the superclass

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class B {
    private let y = 10
}

class A <: B {
    var x = super.y
}

main() {
}
