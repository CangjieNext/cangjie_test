/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a01_01

  @Level:         1

  @Assertion: 6.3.4.1(1)
              If a non-abstract static function with a name same
              as a non-abstract static function in the superclass is declared,
              the function can be declared with an optional modifier redef
              (indicating that it redefines the existing one).

  @Description: Check that the modifier 'redef' is optional for functions
                that redefine functions from the supertype

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006426

*/

import utils.assert.Assert

open class A {
    public static func f1() {}
    public static func f2() {
        return 0
    }
    public static func f3(x: String) {}
    public static func f4(x: String) {
        return 0
    }

    public static func g1<T>() {}
    public static func g2<T>() {
        return 0
    }
    public static func g3<T>(x: String) {}
    public static func g4<T>(x: String) {
        return 0
    }
}

interface I {
    static func i1() {}
    static func i2() {
        return 0
    }
    static func i3(x: String) {}
    static func i4(x: String) {
        return 0
    }

    static func j1():Unit
    static func j2(): Int64
    static func j3(x: String): Unit
    static func j4(x: String): Int64

    static func k1<T>() {}
    static func k2<T>() {
        return 0
    }
    static func k3<T>(x: String) {}
    static func k4<T>(x: String) {
        return 0
    }

    static func l1<T>():Unit
    static func l2<T>(): Int64
    static func l3<T>(x: String): Unit
    static func l4<T>(x: String): Int64
}

class C1 <: A & I {
    public redef static func f1() {}
    public redef static func f2() {
        return 1
    }
    public redef static func f3(x: String) {}
    public redef static func f4(x: String) {
        return 2
    }

    public redef static func g1<T>() {}
    public redef static func g2<T>() {
        return 3
    }
    public redef static func g3<T>(x: String) {}
    public redef static func g4<T>(x: String) {
        return 4
    }

    public redef static func i1() {}
    public redef static func i2() {
        return 5
    }
    public redef static func i3(x: String) {}
    public redef static func i4(x: String) {
        return 6
    }

    public redef static func j1() {}
    public redef static func j2() {
        return 7
    }
    public redef static func j3(x: String) {}
    public redef static func j4(x: String) {
        return 8
    }

    public redef static func k1<T>() {}
    public redef static func k2<T>() {
        return 9
    }
    public redef static func k3<T>(x: String) {}
    public redef static func k4<T>(x: String) {
        return 10
    }

    public redef static func l1<T>() {}
    public redef static func l2<T>() {
        return 11
    }
    public redef static func l3<T>(x: String) {}
    public redef static func l4<T>(x: String) {
        return 12
    }

    func check() {
        Assert.isTrue(f1() is Unit)
        Assert.equals(1, f2())
        Assert.isTrue(f3("") is Unit)
        Assert.equals(2, f4(""))
        Assert.isTrue(g1<Unit>() is Unit)
        Assert.equals(3, g2<Unit>())
        Assert.isTrue(g3<Unit>("") is Unit)
        Assert.equals(4, g4<Unit>(""))
        Assert.isTrue(i1() is Unit)
        Assert.equals(5, i2())
        Assert.isTrue(i3("") is Unit)
        Assert.equals(6, i4(""))
        Assert.isTrue(j1() is Unit)
        Assert.equals(7, j2())
        Assert.isTrue(j3("") is Unit)
        Assert.equals(8, j4(""))
        Assert.isTrue(k1<Unit>() is Unit)
        Assert.equals(9, k2<Unit>())
        Assert.isTrue(k3<Unit>("") is Unit)
        Assert.equals(10, k4<Unit>(""))
        Assert.isTrue(l1<Unit>() is Unit)
        Assert.equals(11, l2<Unit>())
        Assert.isTrue(l3<Unit>("") is Unit)
        Assert.equals(12, l4<Unit>(""))
    }
}

class C2 <: A & I {
    public static func f1() {}
    public static func f2() {
        return 11
    }
    public static func f3(x: String) {}
    public static func f4(x: String) {
        return 12
    }

    public static func g1<T>() {}
    public static func g2<T>() {
        return 13
    }
    public static func g3<T>(x: String) {}
    public static func g4<T>(x: String) {
        return 14
    }

    public static func i1() {}
    public static func i2() {
        return 15
    }
    public static func i3(x: String) {}
    public static func i4(x: String) {
        return 16
    }

    public static func j1() {}
    public static func j2() {
        return 17
    }
    public static func j3(x: String) {}
    public static func j4(x: String) {
        return 18
    }

    public static func k1<T>() {}
    public static func k2<T>() {
        return 19
    }
    public static func k3<T>(x: String) {}
    public static func k4<T>(x: String) {
        return 20
    }

    public static func l1<T>() {}
    public static func l2<T>() {
        return 21
    }
    public static func l3<T>(x: String) {}
    public static func l4<T>(x: String) {
        return 22
    }

    func check() {
        Assert.isTrue(f1() is Unit)
        Assert.equals(11, f2())
        Assert.isTrue(f3("") is Unit)
        Assert.equals(12, f4(""))
        Assert.isTrue(g1<Unit>() is Unit)
        Assert.equals(13, g2<Unit>())
        Assert.isTrue(g3<Unit>("") is Unit)
        Assert.equals(14, g4<Unit>(""))
        Assert.isTrue(i1() is Unit)
        Assert.equals(15, i2())
        Assert.isTrue(i3("") is Unit)
        Assert.equals(16, i4(""))
        Assert.isTrue(j1() is Unit)
        Assert.equals(17, j2())
        Assert.isTrue(j3("") is Unit)
        Assert.equals(18, j4(""))
        Assert.isTrue(k1<Unit>() is Unit)
        Assert.equals(19, k2<Unit>())
        Assert.isTrue(k3<Unit>("") is Unit)
        Assert.equals(20, k4<Unit>(""))
        Assert.isTrue(l1<Unit>() is Unit)
        Assert.equals(21, l2<Unit>())
        Assert.isTrue(l3<Unit>("") is Unit)
        Assert.equals(22, l4<Unit>(""))
    }
}

main() {
    C1().check()
    C2().check()
}