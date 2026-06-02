/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a05_002

  @Level:         1

  @Assertion: 6.2.4.1(5)
              If there is any generic function in the interface,
              the constraints of the type parameters of the implemented function
              must be looser than or the same as the corresponding function in the interface.

  @Description: Check that a struct can implement an abstract generic function
                if it defines a generic function with looser or the same constraints

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006400

*/

import utils.assert.Assert

open class A {}
class B <: A {}

interface I1 {
    static func f1<T>(): Int64
}

interface I2 {
    static func f2<T>(): Int64
}

interface I3 {
    static func f3<T>(): Int64 where T <: B
}

interface I4 {
    static func f4<T1, T2>(): Int64
}

interface I5 {
    static func f5<T1, T2, T3>(): Int64
}

interface I6 {
    static func f6<T1, T2, T3>(): Int64
}

interface I7 {
    static func f7<T1, T2, T3, T4>(): Int64
}

// Implement functions with the same constraints
struct Case1 <: I1 & I2 & I3 & I4 & I5 & I6 & I7 {
    public redef static func f1<T>() {
        return 11
    }
    public redef static func f2<T>() {
        return 12
    }
    public redef static func f3<T>() where T <: B {
        return 13
    }
    public redef static func f4<T1, T2>() {
        return 14
    }
    public redef static func f5<T1, T2, T3>() {
        return 15
    }
    public redef static func f6<T1, T2, T3>() {
        return 16
    }
    public redef static func f7<T1, T2, T3, T4>() {
        return 17
    }
}

// Implement functions without any constraints
struct Case2 <: I1 & I2 & I3 & I4 & I5 & I6 & I7 {
    public redef static func f1<T>() {
        return 21
    }
    public redef static func f2<T>() {
        return 22
    }
    public redef static func f3<T>() {
        return 23
    }
    public redef static func f4<T1, T2>() {
        return 24
    }
    public redef static func f5<T1, T2, T3>() {
        return 25
    }
    public redef static func f6<T1, T2, T3>() {
        return 26
    }
    public redef static func f7<T1, T2, T3, T4>() {
        return 27
    }
}

// Change all upper bounds to Any
struct Case3 <: I2 & I3 & I4 & I5 & I6 & I7 {
    public redef static func f2<T>() where T <: Any {
        return 32
    }
    public redef static func f3<T>() where T <: Any {
        return 33
    }
    public redef static func f4<T1, T2>() where T1 <: Any {
        return 34
    }
    public redef static func f5<T1, T2, T3>() where T1 <: Any {
        return 35
    }
    public redef static func f6<T1, T2, T3>() where T1 <: Any, T2 <: Any {
        return 36
    }
    public redef static func f7<T1, T2, T3, T4>() where T1 <: Any, T3 <: Any {
        return 37
    }
}

// Of two constraints remove the second one
struct Case4 <: I6 & I7 {
    public redef static func f6<T1, T2, T3>() {
        return 46
    }
    public redef static func f7<T1, T2, T3, T4>() {
        return 47
    }
}

// Of two constraints remove the first one
struct Case5 <: I6 & I7 {
    public redef static func f6<T1, T2, T3>() {
        return 56
    }
    public redef static func f7<T1, T2, T3, T4>() {
        return 57
    }
}

// Merge two constraints into one
struct Case6 <: I6 {
    public redef static func f6<T1, T2, T3>() {
        return 66
    }
}


// Make a complex constraint simple by removing the first upper bound 
struct Case7 <: I5 {
    public redef static func f5<T1, T2, T3>() {
        return 75
    }
}

// Make a complex constraint simple by removing the second upper bound 
struct Case8 <: I5 {
    public redef static func f5<T1, T2, T3>() {
        return 85
    }
}

// Loosen constraints by replacing a class upper type with its direct parent
struct Case9 <: I3 {
    public redef static func f3<T>() where T <: A {
        return 93
    }
}

// Loosen constraints by replacing a class upper type with Object
struct Case10 <: I3 {
    public redef static func f3<T>() where T <: Object {
        return 103
    }
}

main() {
    Assert.equals(11, Case1.f1<Nothing>())
    Assert.equals(12, Case1.f2<Nothing>())
    Assert.equals(13, Case1.f3<Nothing>())
    Assert.equals(14, Case1.f4<Nothing, Nothing>())
    Assert.equals(15, Case1.f5<Nothing, Nothing, Nothing>())
    Assert.equals(16, Case1.f6<Nothing, Nothing, Nothing>())
    Assert.equals(17, Case1.f7<Nothing, Nothing, Nothing, Nothing>())

    Assert.equals(21, Case2.f1<Nothing>())
    Assert.equals(22, Case2.f2<Nothing>())
    Assert.equals(23, Case2.f3<Nothing>())
    Assert.equals(24, Case2.f4<Nothing, Nothing>())
    Assert.equals(25, Case2.f5<Nothing, Nothing, Nothing>())
    Assert.equals(26, Case2.f6<Nothing, Nothing, Nothing>())
    Assert.equals(27, Case2.f7<Nothing, Nothing, Nothing, Nothing>())

    Assert.equals(32, Case3.f2<Nothing>())
    Assert.equals(33, Case3.f3<Nothing>())
    Assert.equals(34, Case3.f4<Nothing, Nothing>())
    Assert.equals(35, Case3.f5<Nothing, Nothing, Nothing>())
    Assert.equals(36, Case3.f6<Nothing, Nothing, Nothing>())
    Assert.equals(37, Case3.f7<Nothing, Nothing, Nothing, Nothing>())

    Assert.equals(46, Case4.f6<Nothing, Nothing, Nothing>())
    Assert.equals(47, Case4.f7<Nothing, Nothing, Nothing, Nothing>())

    Assert.equals(56, Case5.f6<Nothing, Nothing, Nothing>())
    Assert.equals(57, Case5.f7<Nothing, Nothing, Nothing, Nothing>())

    Assert.equals(66, Case6.f6<Nothing, Nothing, Nothing>())

    Assert.equals(75, Case7.f5<Nothing, Nothing, Nothing>())

    Assert.equals(85, Case8.f5<Nothing, Nothing, Nothing>())

    Assert.equals(93, Case9.f3<Nothing>())

    Assert.equals(103, Case10.f3<Nothing>())
}