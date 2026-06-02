/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_09_a02_02

  @Level:         1

  @Assertion: 4.9(2)
              this can appear in all instance members and constructors to represent the current instance and super can
              only appear in class type definitions to represent instances of the direct parent class (see Chapter 6
              Classes for details).

  @Description: Check that super usage in class without direct parent class causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

interface I {
    func foo() {}
}

class C <: I {
    func bar() {
        super.foo()
    }
}

main() {}

