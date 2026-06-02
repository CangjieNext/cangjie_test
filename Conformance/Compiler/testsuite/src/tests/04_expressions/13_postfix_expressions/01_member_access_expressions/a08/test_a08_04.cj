/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a08_04

  @Level:         1

  @Assertion: 4.13.1(8) T is this: within the scope of a class or interface, non-static members can be accessed
              using the this keyword.

  @Description: Check that access to static interface member function using this keyword causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

interface I {
    static func foo() {}
}

class C <: I {
    func test() {
        // Access to static interface member function.
        let f = this.foo()
        f()
    }

}

main() {}

