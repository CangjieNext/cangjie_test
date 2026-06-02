/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a10_07

  @Level:         1

  @Assertion:    3.4.2(10) sealed means that the class or interface can only be inherited or implemented in the current
                 package, See class for details

  @Description:  Check that sealed classes and interfaces can be extended.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        6084

*/

import utils.assert.Assert

sealed interface I {
    func f() : Int64
}

sealed abstract class C { }

extend C {
    static func f() { 1 }
}

class A { }

extend A <: I {
    public func f() { 2 }
}

main() {
    Assert.equals(1, C.f())
    let a = A()
    Assert.isTrue(a is I)
    Assert.equals(2, a.f())
}
