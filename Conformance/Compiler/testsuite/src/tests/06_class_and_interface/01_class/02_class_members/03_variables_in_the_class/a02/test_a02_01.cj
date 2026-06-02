/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a02_01

  @Level:         1

  @Assertion: 6.1.2.3(2)
              In the class, instance member variables outside the primary constructor may have initial values.

  @Description: Check that initial values can be assigned to member variables and variables are set to
                these initial values

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006232

  @Comment: The specification does not say anyting about static variables,
            We can just write a bunch of negative tests that initial values for static variables are prohibited,
            but it's like an oversight in the specification.

*/

import utils.assert.Assert

// Initial values are literals
class Test1 {
    public var m1 = 10
    public let m2 = 1.5
    protected var m3 = """
    s
    t
    r"""
    protected let m4 = r's'
    private var m5 = {x: Int64, y: Int64 => x + y }
    private let m6 = [1, 2, 2, 1, 1]
    var m7 = (((1, 2), "a"), (r'a', true), (1.4, [1, 2], 1..10:1))
    let m8 = 1..100:10

    static public var s1 = 1i8
    static public let s2 = 0.0001f16
    static protected var s3 = ()
    static protected let s4 = false
    static private var s5 = b'a'
    static private let s6 = "string"
    static var s7 = 0u64
    static let s8 = 12i32

    func test() {
        Assert.equals(10, this.m1)
        Assert.approxEquals(1.5, this.m2)
        Assert.equals("""
    s
    t
    r""", this.m3)
        Assert.equals(r's', this.m4)
        Assert.equals(22, this.m5(10, 12))
        Assert.equals([1, 2, 2, 1, 1], this.m6)
        Assert.equals(1, this.m7[0][0][0])
        Assert.equals(2, this.m7[0][0][1])
        Assert.equals("a", this.m7[0][1])
        Assert.equals(r'a', this.m7[1][0])
        Assert.equals(true, this.m7[1][1])
        Assert.approxEquals(1.4, this.m7[2][0])
        Assert.equals([1, 2], this.m7[2][1])
        Assert.equals(1..10:1, this.m7[2][2])
        Assert.equals(1..100:10, this.m8)

        Assert.equals(1i8, Test1.s1)
        Assert.approxEquals(0.0001f16, Test1.s2)
        Assert.isTrue(Test1.s3 is Unit)
        Assert.equals(false, Test1.s4)
        Assert.equals(b'a', Test1.s5)
        Assert.equals("string", Test1.s6)
        Assert.equals(0u64, Test1.s7)
        Assert.equals(12i32, Test1.s8)
    }
}

var counter = 0
func f() {
  counter++
  return counter
}

// Initial values are function calls
class Test2 {
    public var m1 = f()
    public let m2 = f()
    protected var m3 = f()
    protected let m4 = f()
    private var m5 = f()
    private let m6 = f()
    var m7 = f()
    let m8 = f()

    static public var s1 = f()
    static public let s2 = f()
    static protected var s3 = f()
    static protected let s4 = f()
    static private var s5 = f()
    static private let s6 = f()
    static var s7 = f()
    static let s8 = f()

    func test() {
        Assert.equals(9, this.m1)
        Assert.equals(10, this.m2)
        Assert.equals(11, this.m3)
        Assert.equals(12, this.m4)
        Assert.equals(13, this.m5)
        Assert.equals(14, this.m6)
        Assert.equals(15, this.m7)
        Assert.equals(16, this.m8)

        Assert.equals(1, Test2.s1)
        Assert.equals(2, Test2.s2)
        Assert.equals(3, Test2.s3)
        Assert.equals(4, Test2.s4)
        Assert.equals(5, Test2.s5)
        Assert.equals(6, Test2.s6)
        Assert.equals(7, Test2.s7)
        Assert.equals(8, Test2.s8)
    }
}

var gv = 10

func cond() {
    return counter > 0
}

// Initial values are other expressions
class Test3 {
    public var m1 = counter
    public let m2 = Test2.s7
    protected var m3 = Test3.s1
    protected let m4 = { => 1 }()
    private var m5 = (counter = 0)
    private let m6 = counter + 20
    var m7 = counter - f() - f()
    let m8 = 1 ** 2

    static public var s1 = 1 > 2
    static public let s2 = if (cond()) { [1, 1] } else { [0, 1] }
    static protected var s3 = match(Test2.s1) {case 1 => r'a'; case _ => r'b'}
    static protected let s4 = "${gv}"
    static private var s5 = [(1, 2), (3, 4)][1][1]
    static private let s6 = !false
    static var s7 = gv++
    static let s8 = f

    func test() {
        Assert.equals(16, this.m1)
        Assert.equals(7, this.m2)
        Assert.equals(false, this.m3)
        Assert.equals(1, this.m4)
        Assert.isTrue(this.m5 is Unit)
        Assert.equals(20, this.m6)
        Assert.equals(-3, this.m7)
        Assert.equals(1, this.m8)

        Assert.equals(false, Test3.s1)
        Assert.equals([1, 1], Test3.s2)
        Assert.equals(r'a', Test3.s3)
        Assert.equals("10", Test3.s4)
        Assert.equals(4, Test3.s5)
        Assert.equals(true, Test3.s6)
        Assert.isTrue(Test3.s7 is Unit)
        Assert.equals(3, Test3.s8())
    }
}

main() {
    let case1 = Test1()
    case1.test()

    let case2 = Test2()
    case2.test()

    let case3 = Test3()
    case3.test()
}