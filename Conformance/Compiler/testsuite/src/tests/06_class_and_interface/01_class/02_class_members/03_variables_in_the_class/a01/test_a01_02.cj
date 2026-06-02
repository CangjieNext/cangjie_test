/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a01_02

  @Level:         1

  @Assertion: 6.1.2.3(1)
              A variable that is declared in a class or interface is called a member variable.
              Member variables can be declared as immutable by the keyword let, or mutable by the keyword var.

  @Description: Check that variables declared with the 'let' keyword
                are accessible both for reading

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006231, 0006136

*/

import utils.assert.Assert

// Initialized
class Test1 {
    public let m1 = 1
    protected let m2 = 2
    private let m3 = 3
    let m4 = 4

    static public let m5 = 5
    static protected let m6 = 6
    static private let m7 = 7
    static let m8 = 8

    func check() {
        let a = m1
        Assert.equals(1, a)
        let b = m2
        Assert.equals(2, b)
        let c = m3
        Assert.equals(3, c)
        let d = m4
        Assert.equals(4, d)
        let e = m5
        Assert.equals(5, e)
        let f = m6
        Assert.equals(6, f)
        let g = m7
        Assert.equals(7, g)
        let h = m8
        Assert.equals(8, h)
    }
}

var static_init_called = false
var init_called = false

// Not Initialized
class Test2 {
    public let m1: Float64
    protected let m2: Bool
    private let m3: String
    let m4: Rune

    static public let m5: Range<Int64>
    static protected let m6: () -> Int64
    static private let m7: (Bool, String, Int64)
    static let m8: Array<Int64>

    init() {
        m1 = 0.01
        m2 = true
        m3 = ""
        m4 = r'a'

        let a = m1
        Assert.approxEquals(0.01, a)
        let b = m2
        Assert.equals(true, b)
        let c = m3
        Assert.equals("", c)
        let d = m4
        Assert.equals(r'a', d)

        init_called = true
    }

    static init() {
        m5 = 1..100:1
        m6 = { => 1 }
        m7 = (true, "a", 1)
        m8 = [1, 2, 3]

        let a = m5
        Assert.equals(1..100:1, a)
        let b = m6
        Assert.equals(1, b())
        let c = m7
        Assert.equals(true, c[0])
        Assert.equals("a", c[1])
        Assert.equals(1, c[2])
        let d = m8
        Assert.equals([1, 2, 3], d)

        static_init_called = true
    }
}

main() {
    let case1 = Test1()
    case1.check()

    let case2 = Test2()
    Assert.equals(true, static_init_called)
    Assert.equals(true, init_called)
}
