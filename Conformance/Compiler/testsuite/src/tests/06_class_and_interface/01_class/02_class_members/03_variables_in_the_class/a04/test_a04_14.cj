/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a04_14

  @Level:         1

  @Assertion: 6.1.2.3(4)
              In this case, the execution sequence of the variable initialization
              is before the call of the super class’s constructor,
              it is prohibited to use qualified names with super
              to access the member variables of the superclass
              in the initial value expression of the instance member variables.

  @Description: Check that a mutable protected instance member variable can not use as an initial value
                an immutable public instance variable of the superclass

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class B {
    public let y = 10
}

class A <: B {
    protected var x = super.y
}

main() {
}
