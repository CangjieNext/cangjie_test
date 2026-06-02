/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_05_a02_003

  @Level:         1

  @Assertion: 6.3.5(2)
              When a subclass inherits a parent class,
              the access level of the override function or
              static function redefinition cannot be changed to be lower
              than the overriden function or redefined static function in the super type.

  @Description: Check the overriding and redefinition in classes can raise the access level
                or leave it the same when inheriting from a sealed class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

sealed abstract class A {
    protected open func f1() {
        return -1
    }
    protected open func f2() {
        return -1
    }
    public open func f3() {
        return -1
    }
    static func f4() {
        return -1
    }
    static func f5() {
        return -1
    }
    static func f6() {
        return -1
    }
    static protected func f7() {
        return -1
    }
    static protected func f8() {
        return -1
    }
    static public func f9() {
        return -1
    }
    static func f10<T>() {
        return -1
    }
    static func f11<T>() {
        return -1
    }
    static func f12<T>() {
        return -1
    }
    static protected func f13<T>() {
        return -1
    }
    static protected func f14<T>() {
        return -1
    }
    static public func f15<T>() {
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
    redef static func f4() {
        return 4
    }
    redef static protected func f5() {
        return 5
    }
    redef static public func f6() {
        return 6
    }
    redef static protected func f7() {
        return 7
    }
    redef static public func f8() {
        return 8
    }
    redef static public func f9() {
        return 9
    }
    redef static func f10<T>() {
        return 10
    }
    redef static protected func f11<T>() {
        return 11
    }
    redef static public func f12<T>() {
        return 12
    }
    redef static protected func f13<T>() {
        return 13
    }
    redef static public func f14<T>() {
        return 14
    }
    redef static public func f15<T>() {
        return 15
    }
}

main() {
    Assert.equals(1, B().f1())
    Assert.equals(2, B().f2())
    Assert.equals(3, B().f3())
    Assert.equals(4, B.f4())
    Assert.equals(5, B.f5())
    Assert.equals(6, B.f6())
    Assert.equals(7, B.f7())
    Assert.equals(8, B.f8())
    Assert.equals(9, B.f9())
    Assert.equals(10, B.f10<Unit>())
    Assert.equals(11, B.f11<Unit>())
    Assert.equals(12, B.f12<Unit>())
    Assert.equals(13, B.f13<Unit>())
    Assert.equals(14, B.f14<Unit>())
    Assert.equals(15, B.f15<Unit>())
}