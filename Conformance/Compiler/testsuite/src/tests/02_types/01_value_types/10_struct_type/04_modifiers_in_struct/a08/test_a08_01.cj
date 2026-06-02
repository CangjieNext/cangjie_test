/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_04_a08_01

  @Level:         1
  @Assertion:       2.1.10.4(8) Members without visibility modifiers are visible both inside the struct definition and
                    inside the package.

  @Description:     Check that struct members without visibility modifiers are visible both inside the struct
                    definition and inside the package.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue: 0006124

*/

import utils.assert.Assert

struct S {
    static let statV: Int64 = 6
    let v: Int64
    static prop statP: Int64 {
        get() { 7 }
    }
    static func statF() { 8 }
    static func statT<T>() { 0 }

    init(a: Int64) { this.v = a }

    prop p: Int64 {
        get() { 2 }
    }

    func f() { 3 }
    func t<T>() { 4 }
    operator func -(right: Int64) { right }

    func test() {
        Assert.equals(6, S.statV)
        Assert.equals(1, v)
        Assert.equals(7, S.statP)
        Assert.equals(8, S.statF())
        Assert.equals(0, S.statT<Nothing>())
        Assert.equals(2, p)
        Assert.equals(3, f())
        Assert.equals(4, t<Nothing>())
        Assert.equals(5, this - 5)
    }
}

main() {
    Assert.equals(6, S.statV)
    Assert.equals(1, S(1).v)
    Assert.equals(7, S.statP)
    Assert.equals(8, S.statF())
    Assert.equals(0, S.statT<Nothing>())
    Assert.equals(2, S(1).p)
    Assert.equals(3, S(1).f())
    Assert.equals(4, S(1).t<Nothing>())
    Assert.equals(5, S(1) - 5)
    S(1).test()
}
