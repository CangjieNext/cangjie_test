/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:     Contains a struct with all public members.

  @Structure:       complex-aux
  @CompileWarning:  no
*/

package p1

import utils.assert.Assert

public struct AuxTestA0701 {
    public static let statV: Int64 = 6
    public let v: Int64
    public static prop let statP: Int64 {
        get() { 7 }
    }
    public static func statF() { 8 }
    public static func statT<T>() { 0 }

    public init(a: Int64) { this.v = a }

    public prop let p: Int64 {
        get() { 2 }
    }

    public func f() { 3 }
    public func t<T>() { 4 }
    public operator func -(right: Int64) { right }
}

public func test() {
    Assert.equals(6, AuxTestA0701.statV)
    Assert.equals(1, AuxTestA0701(1).v)
    Assert.equals(7, AuxTestA0701.statP)
    Assert.equals(8, AuxTestA0701.statF())
    Assert.equals(0, AuxTestA0701.statT<Nothing>())
    Assert.equals(2, AuxTestA0701(1).p)
    Assert.equals(3, AuxTestA0701(1).f())
    Assert.equals(4, AuxTestA0701(1).t<Nothing>())
    Assert.equals(5, AuxTestA0701(1) - 5)
}

