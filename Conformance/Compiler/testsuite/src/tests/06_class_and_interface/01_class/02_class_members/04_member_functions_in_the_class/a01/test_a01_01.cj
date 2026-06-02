/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a01_01

  @Level:         1

  @Assertion: 6.1.2.4(1)
              Functions may be defined in classes, and may be declared in classes or interfaces.
              Note that functions declared in interfaces must be abstract, i.e., without a function body.
              The difference between the definition and declaration is whether the function has a function body.

  @Description: Check the various declarations and definitions of functions in classes and interfaces

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006238

*/

import utils.assert.Assert

interface I {
    // Abstract interface functions
    func ai1(): Unit
    func ai2(x: Int64): Int64
    func ai3(x: Int64, y: String): Bool
    func ai4(a: Rune, b!: Array<Int64>): String
    func ai5(a: Unit): (Int64, Int64, Int64)

    // Abstract interface functions with default implementation
    func fi1() {
        return 8i8
    }
    func fi2(x: Int64, y: Int64, z: Int64) {
        return (x, y, z)
    }
    func fi3(x!: String) {
        Rune(x[0])
    }
    func fi4(a: Rune) {}
    func fi5(x: Array<String>, y: Int64, z: Int64) {
        return x[y + z]
    }
}

abstract class A {
    // Abstract class functions
    public func ac1(): Bool
    protected func ac2(x!: Rune, y!: Rune): String
    public func ac3(x: Range<Int64>): Int64
    protected func ac4(x: Unit): (Array<Int64>, Array<String>)
    public func ac5(z: Bool, l: Bool): Float64
}

open class B <: A & I {
    // Class functions
    func fc1() {
        return 1..100:1
    }
    public func fc2<X, Y>(x: X, y: Y) where X <: ToString, Y <: ToString {
        return x.toString() + y.toString()
    }
    func fc3<T>(x!: Int64 = 12) {
        var i = 0
        var res = Array<Int64>(x) { i => 0 }
        while(i < x) {
            res[i] = 1
            i++
        }
        return res
    }
    open protected func fc4(x: String) {
        return 1e6
    }
    static func fc5(a: Rune) {
        return (a, a, a)
    }

    // Implementation of abstract functions
    public func ai1() {}
    public func ai2(x: Int64) {
        return x * x
    }
    public func ai3(x: Int64, y: String) {
        return y.size > x
    }
    public func ai4(a: Rune, b!: Array<Int64>) {
        return "${a} ${b}"
    }
    public func ai5(a: Unit) {
        return (11, 11, -8)
    }
    public func ac1() {
        return false
    }
    protected func ac2(x!: Rune, y!: Rune) {
        return x.toString() + y.toString()
    }
    public func ac3(x: Range<Int64>) {
        var res = 0
        for (i in x) {
            res++
        }
        return res
    }
    protected func ac4(x: Unit) {
        return ([1, 17, 74], ["m", "mm", "mmm"])
    }
    public func ac5(z: Bool, l: Bool) {
        if (z) {
            if (l) {
                return 0.5
            } else {
                return 0.25
            }
        } else {
            return 0.0125
        }
    }
}

main() {
    let obj = B()
    Assert.isTrue(obj.ai1() is Unit)
    Assert.equals(4, obj.ai2(2))
    Assert.equals(true, obj.ai3(1, "dafafaf"))
    Assert.equals("a [1, 1, 1]", obj.ai4(r'a', b: [1, 1, 1]))
    Assert.equals(11, obj.ai5(())[0])
    Assert.equals(11, obj.ai5(())[1])
    Assert.equals(-8, obj.ai5(())[2])

    Assert.equals(false, obj.ac1())
    Assert.equals("cd", obj.ac2(x: r'c', y: r'd'))
    Assert.equals(50, obj.ac3(0..100:2))
    Assert.equals([1, 17, 74], obj.ac4(())[0])
    Assert.equals(["m", "mm", "mmm"], obj.ac4(())[1])
    Assert.approxEquals(0.25, obj.ac5(true, false))

    Assert.equals(8i8, obj.fi1())
    Assert.equals(7, obj.fi2(7, 8, 9)[0])
    Assert.equals(8, obj.fi2(7, 8, 9)[1])
    Assert.equals(9, obj.fi2(7, 8, 9)[2])
    Assert.equals(r'n', obj.fi3(x: "no"))
    Assert.isTrue(obj.fi4(r'o') is Unit)
    Assert.equals("34", obj.fi5(["5", "3", "76", "1", "7", "34", "98"], 3, 2))

    Assert.equals(1..100:1, obj.fc1())
    Assert.equals("[1, 2][3, 4]", obj.fc2<Array<Int64>, Array<Int64>>([1, 2], [3, 4]))
    Assert.equals([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], obj.fc3<Bool>())
    Assert.approxEquals(1e6, obj.fc4(""))
    Assert.equals(r'o', B.fc5(r'o')[0])
    Assert.equals(r'o', B.fc5(r'o')[1])
    Assert.equals(r'o', B.fc5(r'o')[2])
}
