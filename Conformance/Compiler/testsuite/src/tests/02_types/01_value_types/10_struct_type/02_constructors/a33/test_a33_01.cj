/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a33_01

  @Level:         1

  @Assertion: 2.1.10.2(33)
              Not allowed to use the instance member variable this.variableName
              and its syntax sugar variableName
              as the default value of constructor parameters.

  @Description: Check that correct initial values of optional parameters work correctly

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

var g1 = 10
var g2 = "10"
var g3 = r'c'

func gf1() {
    return 100
}

func gf2() {
    return "ppp"
}

func gf3() {
    return [1, 1, 1, 1]
}

// Literals as default values
struct Test1 {
    init(p1!: Int64 = 1, p2!: String = "", p3!: Rune = r'a', p4!: Bool = false,
        p5!: Float32 = 0.1f32, p6!: (Int64, Int64) = (1, 1), p7!: () -> Int64 = { => 10}, p8!: Unit = (),
        p9!: Array<Int64> = [1, 2, 3], p10!: Range<Int64> = 1..=100:2) {
        Assert.equals(1, p1)
        Assert.equals("", p2)
        Assert.equals(r'a', p3)
        Assert.equals(false, p4)
        Assert.approxEquals(0.1f32, p5)
        Assert.equals(1, p6[0])
        Assert.equals(1, p6[1])
        Assert.equals(10, p7())
        Assert.isTrue(p8 is Unit)
        Assert.equals([1, 2, 3], p9)
        Assert.equals(1..=100:2, p10)
    }
}

// Static variables as default values
struct Test2 {
    init(p1!: Int64 = p_x, p2!: String = p_y, p3!: Unit = p_z, p4!: Int64 = x, p5!: Rune = y, p6!: Bool = z) {
        Assert.equals(1, p1)
        Assert.equals("", p2)
        Assert.isTrue(p3 is Unit)
        Assert.equals(2, p4)
        Assert.equals(r'a', p5)
        Assert.equals(true, p6)
    }

    static let x = 2
    static var y = r'a'
    static let z = true

    static let p_x = 1
    static var p_y = ""
    static var p_z = ()
}

// Global variables as default values
struct Test3 {
    init(p1!: Int64 = g1, p2!: String = g2, p3!: Rune = g3) {
        Assert.equals(10, p1)
        Assert.equals("10", p2)
        Assert.equals(r'c', p3)
    }
}

// Static function calls as default values
struct Test4 {
    init(p1!: Int64 = p_f1(), p2!: String = p_f2(), p3!: Rune = p_f3(),
        p4!: Int64 = f1(), p5!: String = f2(), p6!: Rune = f3()) {
        Assert.equals(1, p1)
        Assert.equals("1", p2)
        Assert.equals(r'1', p3)
        Assert.equals(2, p4)
        Assert.equals("2", p5)
        Assert.equals(r'2', p6)
    }

    static func f1() {
        return 2
    }

    static func f2() {
        return "2"
    }

    static func f3() {
        return r'2'
    }

    static let p_x = 1
    static var p_y = ""
    static var p_z = ()

    static func p_f1() {
        return 1
    }

    static func p_f2() {
        return "1"
    }

    static func p_f3() {
        return r'1'
    }
}

// Global function calls as default values
struct Test5 {
    init(p1!: Int64 = gf1(), p2!: String = gf2(), p3!: Array<Int64> = gf3()) {
        Assert.equals(100, p1)
        Assert.equals("ppp", p2)
        Assert.equals([1, 1, 1, 1], p3)
    }
}

// Static properties as default values
struct Test6 {
    init(p1!: Int64 = p_mp, p2!: Rune = p_ip, p3!: Int64 = mp, p4!: Rune = ip) {
        Assert.equals(20, p1)
        Assert.equals(r'f', p2)
        Assert.equals(30, p3)
        Assert.equals(r's', p4)
    }

    static mut prop mp: Int64 {
      get() {
          30
      }
      set(v) {}
    }

    static prop ip: Rune {
        get() {
            r's'
        }
    }

    static mut prop p_mp: Int64 {
        get() {
            20
        }
        set(v) {}
    }

    static prop p_ip: Rune {
        get() {
            r'f'
        }
    }
}

struct TmpC {
    TmpC(public let x: Int64) {}
}

struct TmpS {
    TmpS(public let x: Int64) {}
}

// Instance creation as default values
struct Test7 {
    init(p1!: TmpC = TmpC(1), p2!: TmpC = TmpC(10), p3!: TmpS = TmpS(-1), p4!: TmpS = TmpS(-10)) {
        Assert.equals(1, p1.x)
        Assert.equals(10, p2.x)
        Assert.equals(-1, p3.x)
        Assert.equals(-10, p4.x)
    }
}

// Expressions as default values
struct Test8 {
    init(p1!: Int64 = g1 + 1, p2!: String = g2 + "${g1}", p3!: Int64 = {x: Int64 => x ** 2}(5)) {
        Assert.equals(11, p1)
        Assert.equals("1010", p2)
        Assert.equals(25, p3)
    }
}

main() {
    let case1 = Test1()
    let case2 = Test2()
    let case3 = Test3()
    let case4 = Test4()
    let case5 = Test5()
    let case6 = Test6()
    let case7 = Test7()
    let case8 = Test8()
}