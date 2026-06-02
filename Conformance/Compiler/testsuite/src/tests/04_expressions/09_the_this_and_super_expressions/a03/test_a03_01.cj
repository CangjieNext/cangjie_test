/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_09_a03_01

  @Level:         1

  @Assertion: 4.9(3)
              Using separate super expression is not allowed.

  @Description: Check that usage of a separate super expression causes a compilation error.
  
  @Mode: compileonly

  @Negative: yes

*/

open class B {
    func foo() {}
}

class C <: B {
    func bar() {
        // Usage of a separate super expression.
        super
        return
    }
}

main() {}

