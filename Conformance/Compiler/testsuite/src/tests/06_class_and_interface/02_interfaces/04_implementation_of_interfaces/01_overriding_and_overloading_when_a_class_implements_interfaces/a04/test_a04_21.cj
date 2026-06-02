/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a04_21

  @Level:         1

  @Assertion: 6.2.4.1(4)
              The return type of the implemented function should be the same as
              or a subtype of the return type of the corresponding function in the interface.

  @Description: Check that a class can not implement an abstract operator
                from a superinterface by defining an operator with the return type
                that is a supertype of the return type of the abstract operator
                with the 'override' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class Parent {}
class Child <: Parent {}

interface I {
    operator func ()(): Child
}

class A <: I {
    public override operator func ()(): Parent {
        return Child()
    }
}

main() {
}

