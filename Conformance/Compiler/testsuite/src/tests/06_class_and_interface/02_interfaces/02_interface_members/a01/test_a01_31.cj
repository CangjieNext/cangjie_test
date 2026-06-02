/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_a01_31

  @Level:         1

  @Assertion: 6.2.2(1)
              The members of an interface include
              • members declared in the body of the interface which include static member functions,
                instance member functions, operator overloading functions,
                static member properties and instance member properties.
              • and members inherited from other interfaces.

  @Description: Check that an instance mutable property of a struct that implements an interface
                is not a member of a super-interface

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

interface I1 {
    func f(x: I1) {
        x.p
    }
}

struct A <: I1 {
    mut prop p: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

main() {
}