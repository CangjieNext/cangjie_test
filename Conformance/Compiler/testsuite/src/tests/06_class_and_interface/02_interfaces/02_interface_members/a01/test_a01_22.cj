/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_a01_22

  @Level:         1

  @Assertion: 6.2.2(1)
              The members of an interface include
              • members declared in the body of the interface which include static member functions,
                instance member functions, operator overloading functions,
                static member properties and instance member properties.
              • and members inherited from other interfaces.

  @Description: Check that a static mutable property of a class that implements an interface
                is not a member of a super-interface

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

interface I1 {
    func f() {
        I1.p
    }
}

class A <: I1 {
    static mut prop p: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

main() {
}