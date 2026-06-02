/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_04_a07_13

  @Level:         1

  @Assertion: 6.1.4(7)
              The return type of an open function containing This must remain of type This when it is overridden.

  @Description: Check that it's illegal to change the return type of a function
                that overrides a protected open function inherited from an abstract class
                to the child class type

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

abstract class A {
    protected open func f(): This {
        this
    }
}

class B <: A {
    protected func f(): B {
        return this
    }
}

main() {
}