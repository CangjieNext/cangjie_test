/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_05_a02_002

  @Level:         1

  @Assertion: 6.3.5(2)
              When a subclass inherits a parent class,
              the access level of the override function or
              static function redefinition cannot be changed to be lower
              than the overriden function or redefined static function in the super type.

  @Description: Check the overriding and redefinition in classes can raise the access level
                or leave it the same when inheriting from an abstract class

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

abstract class A {
    protected open func f1() {
        return -1
    }
    protected open func f2() {
        return -1
    }
    public open func f3() {
        return -1
    }
    protected open func f4(): Int64
    protected open func f5(): Int64
    public open func f6(): Int64

    static func f7() {
        return -1
    }
    static func f8() {
        return -1
    }
    static func f9() {
        return -1
    }
    static protected func f10() {
        return -1
    }
    static protected func f11() {
        return -1
    }
    static public func f12() {
        return -1
    }
    static func f13<T>() {
        return -1
    }
    static func f14<T>() {
        return -1
    }
    static func f15<T>() {
        return -1
    }
    static protected func f16<T>() {
        return -1
    }
    static protected func f17<T>() {
        return -1
    }
    static public func f18<T>() {
        return -1
    }
}

class B <: A {
    override protected func f1() {
        return 1
    }
    override public func f2() {
        return 2
    }
    override public func f3() {
        return 3
    }
    override protected func f4() {
        return 4
    }
    override public func f5() {
        return 5
    }
    override public func f6() {
        return 6
    }
    redef static func f7() {
        return 7
    }
    redef static protected func f8() {
        return 8
    }
    redef static public func f9() {
        return 9
    }
    redef static protected func f10() {
        return 10
    }
    redef static public func f11() {
        return 11
    }
    redef static public func f12() {
        return 12
    }
    redef static func f13<T>() {
        return 13
    }
    redef static protected func f14<T>() {
        return 14
    }
    redef static public func f15<T>() {
        return 15
    }
    redef static protected func f16<T>() {
        return 16
    }
    redef static public func f17<T>() {
        return 17
    }
    redef static public func f18<T>() {
        return 18
    }
}

main() {
    Assert.equals(1, B().f1())
    Assert.equals(2, B().f2())
    Assert.equals(3, B().f3())
    Assert.equals(4, B().f4())
    Assert.equals(5, B().f5())
    Assert.equals(6, B().f6())
    Assert.equals(7, B.f7())
    Assert.equals(8, B.f8())
    Assert.equals(9, B.f9())
    Assert.equals(10, B.f10())
    Assert.equals(11, B.f11())
    Assert.equals(12, B.f12())
    Assert.equals(13, B.f13<Unit>())
    Assert.equals(14, B.f14<Unit>())
    Assert.equals(15, B.f15<Unit>())
    Assert.equals(16, B.f16<Unit>())
    Assert.equals(17, B.f17<Unit>())
    Assert.equals(18, B.f18<Unit>())
}