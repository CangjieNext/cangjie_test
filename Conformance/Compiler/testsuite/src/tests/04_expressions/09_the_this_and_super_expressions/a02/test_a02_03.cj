/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_09_a02_03

  @Level:         1

  @Assertion: 4.9(2)
              this can appear in all instance members and constructors to represent the current instance and super can
              only appear in class type definitions to represent instances of the direct parent class (see Chapter 6
              Classes for details).

  @Description: Check that super usage in struct causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

interface I {
    func foo() {}
}

struct S2 <: I {
    var x: Int64 = 0

    func getX() {
        super.foo()
        return x
    }
}

main() {}

