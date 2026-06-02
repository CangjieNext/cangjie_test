/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: public: A function declared with modifier public can be accessed outside the package

  @Description: Definition of classes with public member functions

  @Structure: complex-aux
*/

package a26

import utils.assert.Assert

public open class Remote {
    public func f1() {}
    public func f2(x: Int64) {}
    public func f3() {
        return 1
    }
    public func f4(x: Int64) {
        return 2
    }

    public func f5<T>() {}
    public func f6<T>(x: Int64) {}
    public func f7<T>() {
        return 3
    }
    public func f8<T>(x: Int64) {
        return 4
    }

    public static func f9() {}
    public static func f10(x: Int64) {}
    public static func f11() {
        return 5
    }
    public static func f12(x: Int64) {
        return 6
    }

    public static func f13<T>() {}
    public static func f14<T>(x: Int64) {}
    public static func f15<T>() {
        return 7
    }
    public static func f16<T>(x: Int64) {
        return 8
    }
}

public abstract class ForInheritance {
    public open func f1() {
        Assert.isTrue(false)
    }
    public open func f2(x: Int64) {
        Assert.isTrue(false)
    }
    public open func f3() {
        Assert.isTrue(false)
        return 1
    }
    public open func f4(x: Int64) {
        Assert.isTrue(false)
        return 2
    }

    public func f5(): Unit
    public func f6(x: Int64): Unit
    public func f7(): Int64
    public func f8(x: Int64): Int64

    public static func f9() {
        Assert.isTrue(false)
    }
    public static func f10(x: Int64) {
        Assert.isTrue(false)
    }
    public static func f11() {
        Assert.isTrue(false)
        return 3
    }
    public static func f12(x: Int64) {
        Assert.isTrue(false)
        return 4
    }

    public static func f13<T>() {
        Assert.isTrue(false)
    }
    public static func f14<T>(x: Int64) {
        Assert.isTrue(false)
    }
    public static func f15<T>() {
        Assert.isTrue(false)
        return 5
    }
    public static func f16<T>(x: Int64) {
        Assert.isTrue(false)
        return 6
    }
}