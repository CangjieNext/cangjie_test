
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a14_03

  @Level:         1

  @Assertion:   6.1.2.2(14) - That means there is no guarantee that all static member variables of a parent class must
                be initialized before the initialization of the current class:
  @Description: Checks that compilation fails because static initializer of a child class tries to access static member
                variable of its parent class when the child classes is declared earlier that its parent. Case where the
                parent static member variable is initialized directly.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

class A <: B {
    static var y : Int64

    static init() {
        y = x
    }
}

open class B {
    static var x = 1
}

main() { }
