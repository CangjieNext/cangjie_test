/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_04_02_a01_01

  @Level:         1

  @Assertion: 6.4.2(1)
              In Cangjie programming language, nonstatic abstract functions and open functions
              in classes and interfaces are allowed to declare generic parameters

  @Description: Check that functions in classes and interfaces can be generic.

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I {
    static func f1<T>() {
        return 1
    }
    static func f2<T>(): Int64
}

abstract class A {
    func f3<T>() {
        return 3
    }
    static func f4<T>() {
        return 4
    }
}

open class B <: A & I {
    func f5<T>() {
        return 5
    }
    static func f6<T>() {
        return 6
    }

    public static func f2<T>() {
        return 2
    }
}

class C <: B {
    func f7<T>() {
        return 7
    }
    static func f8<T>() {
        return 8
    }
}

main() {
    let c = C()
    Assert.equals(1, C.f1<Unit>())
    Assert.equals(2, C.f2<Unit>())
    Assert.equals(3, C().f3<Unit>())
    Assert.equals(4, C.f4<Unit>())
    Assert.equals(5, C().f5<Unit>())
    Assert.equals(6, C.f6<Unit>())
    Assert.equals(7, C().f7<Unit>())
    Assert.equals(8, C.f8<Unit>())
}