/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a01_02

  @Level:         1

  @Assertion: 6.3.4.1(1)
              If a non-abstract static function with a name same
              as a non-abstract static function in the superclass is declared,
              the function can be declared with an optional modifier redef
              (indicating that it redefines the existing one).

  @Description: Check that the modifier 'redef' is optional for functions
                that redefine functions from the supertype in generic subtypes

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

class C1<U> <: A & I {
    public redef static func f1() {}
    public redef static func f2() {
        return 21
    }
    public redef static func f3(x: String) {}
    public redef static func f4(x: String) {
        return 22
    }

    public redef static func g1<T>() {}
    public redef static func g2<T>() {
        return 23
    }
    public redef static func g3<T>(x: String) {}
    public redef static func g4<T>(x: String) {
        return 24
    }

    public redef static func i1() {}
    public redef static func i2() {
        return 25
    }
    public redef static func i3(x: String) {}
    public redef static func i4(x: String) {
        return 26
    }

    public redef static func j1() {}
    public redef static func j2() {
        return 27
    }
    public redef static func j3(x: String) {}
    public redef static func j4(x: String) {
        return 28
    }

    public redef static func k1<T>() {}
    public redef static func k2<T>() {
        return 29
    }
    public redef static func k3<T>(x: String) {}
    public redef static func k4<T>(x: String) {
        return 30
    }

    public redef static func l1<T>() {}
    public redef static func l2<T>() {
        return 31
    }
    public redef static func l3<T>(x: String) {}
    public redef static func l4<T>(x: String) {
        return 32
    }

    func check() {
        Assert.isTrue(f1() is Unit)
        Assert.equals(21, f2())
        Assert.isTrue(f3("") is Unit)
        Assert.equals(22, f4(""))
        Assert.isTrue(g1<Unit>() is Unit)
        Assert.equals(23, g2<Unit>())
        Assert.isTrue(g3<Unit>("") is Unit)
        Assert.equals(24, g4<Unit>(""))
        Assert.isTrue(i1() is Unit)
        Assert.equals(25, i2())
        Assert.isTrue(i3("") is Unit)
        Assert.equals(26, i4(""))
        Assert.isTrue(j1() is Unit)
        Assert.equals(27, j2())
        Assert.isTrue(j3("") is Unit)
        Assert.equals(28, j4(""))
        Assert.isTrue(k1<Unit>() is Unit)
        Assert.equals(29, k2<Unit>())
        Assert.isTrue(k3<Unit>("") is Unit)
        Assert.equals(30, k4<Unit>(""))
        Assert.isTrue(l1<Unit>() is Unit)
        Assert.equals(31, l2<Unit>())
        Assert.isTrue(l3<Unit>("") is Unit)
        Assert.equals(32, l4<Unit>(""))
    }
}

class C2<U> <: A & I {
    public static func f1() {}
    public static func f2() {
        return 31
    }
    public static func f3(x: String) {}
    public static func f4(x: String) {
        return 32
    }

    public static func g1<T>() {}
    public static func g2<T>() {
        return 33
    }
    public static func g3<T>(x: String) {}
    public static func g4<T>(x: String) {
        return 34
    }

    public static func i1() {}
    public static func i2() {
        return 35
    }
    public static func i3(x: String) {}
    public static func i4(x: String) {
        return 36
    }

    public static func j1() {}
    public static func j2() {
        return 37
    }
    public static func j3(x: String) {}
    public static func j4(x: String) {
        return 38
    }

    public static func k1<T>() {}
    public static func k2<T>() {
        return 39
    }
    public static func k3<T>(x: String) {}
    public static func k4<T>(x: String) {
        return 40
    }

    public static func l1<T>() {}
    public static func l2<T>() {
        return 41
    }
    public static func l3<T>(x: String) {}
    public static func l4<T>(x: String) {
        return 42
    }

    func check() {
        Assert.isTrue(f1() is Unit)
        Assert.equals(31, f2())
        Assert.isTrue(f3("") is Unit)
        Assert.equals(32, f4(""))
        Assert.isTrue(g1<Unit>() is Unit)
        Assert.equals(33, g2<Unit>())
        Assert.isTrue(g3<Unit>("") is Unit)
        Assert.equals(34, g4<Unit>(""))
        Assert.isTrue(i1() is Unit)
        Assert.equals(35, i2())
        Assert.isTrue(i3("") is Unit)
        Assert.equals(36, i4(""))
        Assert.isTrue(j1() is Unit)
        Assert.equals(37, j2())
        Assert.isTrue(j3("") is Unit)
        Assert.equals(38, j4(""))
        Assert.isTrue(k1<Unit>() is Unit)
        Assert.equals(39, k2<Unit>())
        Assert.isTrue(k3<Unit>("") is Unit)
        Assert.equals(40, k4<Unit>(""))
        Assert.isTrue(l1<Unit>() is Unit)
        Assert.equals(41, l2<Unit>())
        Assert.isTrue(l3<Unit>("") is Unit)
        Assert.equals(42, l4<Unit>(""))
    }
}

main() {
    C1<Bool>().check()
    C2<String>().check()
}