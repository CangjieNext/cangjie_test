/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a05_01

  @Level:         1

  @Assertion:    3.4.2(5) static means that the member is a static member, and static members cannot be accessed
                 through instance objects, See class for details

  @Description:  Check that static members can be accessed using the type name without instantiation.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        6124
*/

import utils.assert.Assert

struct S {
    static let E = 2.71
}

interface I {
    static func foo1() {
        return "foo1"
    }
}

class C <: I {
    static public var currentYear = 2023
    static protected let PI = 3.14

    static func foo2() {
        return "foo2"
    }

    static mut prop b: Int64 {
        get() { 100 }
        set(p) {  }
    }
}

extend C {
    protected static func foo3() {
        return "foo3"
    }
}

main() {
    Assert.equals(2.71, S.E)
    Assert.equals("foo1", I.foo1())
    Assert.equals("foo2", C.foo2())
    Assert.equals("foo3", C.foo3())
    Assert.equals(2023, C.currentYear)
    Assert.equals(3.14, C.PI)
    Assert.equals(100, C.b)
}
