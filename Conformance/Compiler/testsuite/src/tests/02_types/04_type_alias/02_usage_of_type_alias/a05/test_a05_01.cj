/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_04_02_a05_01

  @Level:         1

  @Assertion:    2.4.2(5) If it is a type alias for class, interface, struct, it can be used as a type name of its
                 static member variable or static function inside.

  @Description:  Check that the class\interface\struct alias can be used as a type name of static member

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

type s = S
type i = I
type c = C

struct S {
    static var s = 1
    static var i = 2
    static func c() {}
}

interface I {
    static func s() {}
    static func c() {}
    static func i() {}
}

open class C {
    static var s = 1
    static var i = 2
    static func c() {}
}

main(): Unit {
    Assert.equals(1, s.s)
    Assert.equals(2, s.i)
    Assert.isTrue(s.c is ()->Unit)

    Assert.isTrue(i.s is ()->Unit)
    Assert.isTrue(i.i is ()->Unit)
    Assert.isTrue(i.c is ()->Unit)

    Assert.equals(1, c.s)
    Assert.equals(2, c.i)
    Assert.isTrue(c.c is ()->Unit)
}
