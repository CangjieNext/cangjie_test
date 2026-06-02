/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a01_01

  @Level:         1

  @Assertion: 6.1.2.3(1)
              A variable that is declared in a class or interface is called a member variable.
              Member variables can be declared as immutable by the keyword let, or mutable by the keyword var.

  @Description: Check that variables declared with the 'var' keyword
                are accessible both for reading and writing

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006231, 0006136

*/

import utils.assert.Assert

// Initialized
class Test1 {
    public var m1 = 1
    protected var m2 = 2
    private var m3 = 3
    var m4 = 4

    static public var m5 = 5
    static protected var m6 = 6
    static private var m7 = 7
    static var m8 = 8

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

        m1 = 10
        Assert.equals(10, m1)
        m2 = 20
        Assert.equals(20, m2)
        m3 = 30
        Assert.equals(30, m3)
        m4 = 40
        Assert.equals(40, m4)
        m5 = 50
        Assert.equals(50, m5)
        m6 = 60
        Assert.equals(60, m6)
        m7 = 70
        Assert.equals(70, m7)
        m8 = 80
        Assert.equals(80, m8)
    }
}

var static_init_called = false
var init_called = false

// Not Initialized
class Test2 {
    public var m1: Float64
    protected var m2: Bool
    private var m3: String
    var m4: Rune

    static public var m5: Range<Int64>
    static protected var m6: () -> Int64
    static private var m7: (Bool, String, Int64)
    static var m8: Array<Int64>

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

        m1 = 9.6e-50
        m2 = false
        m3 = "str"
        m4 = r'u'
        Assert.approxEquals(9.6e-50, m1)
        Assert.equals(false, m2)
        Assert.equals("str", m3)
        Assert.equals(r'u', m4)

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

        m5 = -10..=10:2
        m6 = { => 2 }
        m7 = (false, "b", 3)
        m8 = [0, 0, 0, 0, 0]
        Assert.equals(-10..=10:2, m5)
        Assert.equals(2, m6())
        Assert.equals(false, m7[0])
        Assert.equals("b", m7[1])
        Assert.equals(3, m7[2])
        Assert.equals([0, 0, 0, 0, 0], m8)

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
