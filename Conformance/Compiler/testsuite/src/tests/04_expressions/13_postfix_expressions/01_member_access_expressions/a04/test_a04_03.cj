/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a04_03

  @Level:         1

  @Assertion: 4.13.1(4) If T is an object of a class, a non-static member of the class
              or interface can be accessed in this way.

  @Description: Check that member access expressions T.a where T is an object of a class and a is a static
                member of interface causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

interface I {
    static func foo() {
        return 42
    }
}

class C <: I {}

main() {
    let c = C()
    c.foo
    return
}

