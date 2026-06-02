/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*

  @Assertion: protected: A function declared with modifier protected
              can only be accessed in this package or in this class and its subclasses.

  @Description: Definition of classes with protected member functions

  @Structure: complex-aux
*/

package a30

import utils.assert.Assert

public open class Remote {
    protected func f1() {}
    protected func f2(x: Int64) {}
    protected func f3() {
        return 1
    }
    protected func f4(x: Int64) {
        return 2
    }

    protected func f5<T>() {}
    protected func f6<T>(x: Int64) {}
    protected func f7<T>() {
        return 3
    }
    protected func f8<T>(x: Int64) {
        return 4
    }

    protected static func f9() {}
    protected static func f10(x: Int64) {}
    protected static func f11() {
        return 5
    }
    protected static func f12(x: Int64) {
        return 6
    }

    protected static func f13<T>() {}
    protected static func f14<T>(x: Int64) {}
    protected static func f15<T>() {
        return 7
    }
    protected static func f16<T>(x: Int64) {
        return 8
    }
}

public abstract class ForInheritance {
    protected open func f1() {
        Assert.isTrue(false)
    }
    protected open func f2(x: Int64) {
        Assert.isTrue(false)
    }
    protected open func f3() {
        Assert.isTrue(false)
        return 1
    }
    protected open func f4(x: Int64) {
        Assert.isTrue(false)
        return 2
    }

    protected func f5(): Unit
    protected func f6(x: Int64): Unit
    protected func f7(): Int64
    protected func f8(x: Int64): Int64

    protected static func f9() {
        Assert.isTrue(false)
    }
    protected static func f10(x: Int64) {
        Assert.isTrue(false)
    }
    protected static func f11() {
        Assert.isTrue(false)
        return 3
    }
    protected static func f12(x: Int64) {
        Assert.isTrue(false)
        return 4
    }

    protected static func f13<T>() {
        Assert.isTrue(false)
    }
    protected static func f14<T>(x: Int64) {
        Assert.isTrue(false)
    }
    protected static func f15<T>() {
        Assert.isTrue(false)
        return 5
    }
    protected static func f16<T>(x: Int64) {
        Assert.isTrue(false)
        return 6
    }
}