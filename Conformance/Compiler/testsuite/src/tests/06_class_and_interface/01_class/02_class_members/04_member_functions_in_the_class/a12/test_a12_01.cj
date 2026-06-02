/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a12_01

  @Level:         1

  @Assertion: 6.1.2.4(12)
              Abstract instance member functions have the semantics of open by default.

  @Description: Check that abstract functions can be overridden in subclasses.

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

abstract class Top {
    public func t1(): Int64
    public func t2(x: Int64): Int64
    public func t3(x: String): Int64
    public func t4(x: Bool, y!: Rune): Int64
    public func t5(a: (Int64, Int64)): Int64
    public func t6(x: (Rune) -> Float64): Int64
    public func t7(x: Unit, y: Unit): Int64
    public func t8(a: Rune, b: Rune): Int64
    public func t9(x: Array<Bool>): Int64
    public func t10(x: Range<Int64>): Int64
}

abstract class Middle <: Top {
    protected func m1(): Float64
    protected func m2(x: Int64): Array<Int64>
    protected func m3(x: Int64, y: Int64): Range<Int64>
    protected func m4(x: Int64, y: Int64, z: Int64): (Int64, Int64, Int64)
    protected func m5(a: Int64, b: Int64, c: Int64, d: Int64): String
    protected func m26(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64, f: Int64, g: Int64, h: Int64, i: Int64,
                       j: Int64, k: Int64, l: Int64, m: Int64, n: Int64, o: Int64, p: Int64, q: Int64, r: Int64,
                       s: Int64, t: Int64, u: Int64, v: Int64, w: Int64, x: Int64, y: Int64, z: Int64): Int64
}

class Bottom <: Middle {
    public func t1() {
        return 1
    }
    public func t2(x: Int64) {
        return x + 1
    }
    public func t3(x: String) {
        return x.size
    }
    public func t4(x: Bool, y!: Rune) {
        return 4
    }
    public func t5(a: (Int64, Int64)) {
        return a[0] + a[1]
    }
    public func t6(x: (Rune) -> Float64) {
        return Int64(x(r'a'))
    }
    public func t7(x: Unit, y: Unit) {
        return  7
    }
    public func t8(a: Rune, b: Rune) {
        return 8
    }
    public func t9(x: Array<Bool>) {
        return x.size
    }
    public func t10(x: Range<Int64>) {
        var i = 0
        for(it in x) {
            i++
        }
        return i
    }
    protected func m1() {
        return 0.000001
    }
    protected func m2(x: Int64) {
        return [x, x + 1, x + 2]
    }
    protected func m3(x: Int64, y: Int64) {
        return x..y:1
    }
    protected func m4(x: Int64, y: Int64, z: Int64) {
        return (x + 1, y + 2, z + 3)
    }
    protected func m5(a: Int64, b: Int64, c: Int64, d: Int64) {
        return "${a}, ${b}, ${c}, ${d}"
    }
    protected func m26(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64, f: Int64, g: Int64, h: Int64, i: Int64,
                       j: Int64, k: Int64, l: Int64, m: Int64, n: Int64, o: Int64, p: Int64, q: Int64, r: Int64,
                       s: Int64, t: Int64, u: Int64, v: Int64, w: Int64, x: Int64, y: Int64, z: Int64) {
        return a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p + q + r + s + t + u +
                v + w + x + y + z
    }
}

main() {
    let obj = Bottom()
    Assert.equals(1, obj.t1())
    Assert.equals(2, obj.t2(1))
    Assert.equals(3, obj.t3("abc"))
    Assert.equals(4, obj.t4(false, y: r'a'))
    Assert.equals(5, obj.t5((2, 3)))
    Assert.equals(6, obj.t6({x: Rune => 6.13414}))
    Assert.equals(7, obj.t7((), ()))
    Assert.equals(8, obj.t8(r'u', r'p'))
    Assert.equals(9, obj.t9([false, false, true, true, true, false, false, true, false]))
    Assert.equals(10, obj.t10(0..10:1))
    Assert.approxEquals(0.000001, obj.m1())
    Assert.equals([7, 8, 9], obj.m2(7))
    Assert.equals(90..97:1, obj.m3(90, 97))
    Assert.equals(10, obj.m4(9, 4, 1)[0])
    Assert.equals(6, obj.m4(9, 4, 1)[1])
    Assert.equals(4, obj.m4(9, 4, 1)[2])
    Assert.equals("0, -4, 16, 11", obj.m5(0, -4, 16, 11))
    Assert.equals(351, obj.m26(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
                               15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26))
}