
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a16_01

  @Level:         1

  @Assertion:   6.1.2.2(16) •Static member variables must be initialized in only one way, either directly, by the right
                hand side expression, or in a static initializer;
  @Description: Checks iniatizilation of static member variables directly and in a static initializer.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert

abstract class A1 {
    static var x = 1

    static let y = 2
}

abstract class A2 {
    static var a : Int64
    static let b : Int64

    static init() {
        a = 3
        b = 4
    }
}

class C1 <: A1 {
    static var a = 5
    static let b = 6
}

class C2 <: A2 {
    static var x : Int64
    static let y : Int64

    static init() {
        x = 7
        y = 8
    }
}

class G1<T> {
    static var a = 9
    static let b = 10
}

class G2<T> {
    static var x : Int64
    static let y : Int64

    static init() {
        x = 11
        y = 12
    }
}

struct S1 {
    static var a = 9
    static let b = 10
}

struct S2 {
    static var x : Int64
    static let y : Int64

    static init() {
        x = 15
        y = 16
    }
}

main() {
    Assert.equals(1, A1.x)
    Assert.equals(2, A1.y)
    Assert.equals(3, A2.a)
    Assert.equals(4, A2.b)
    Assert.equals(5, C1.a)
    Assert.equals(6, C1.b)
    Assert.equals(7, C2.x)
    Assert.equals(8, C2.y)
    Assert.equals(9, G1<String>.a)
    Assert.equals(10, G1<String>.b)
    Assert.equals(11, G2<String>.x)
    Assert.equals(12, G2<String>.y)
    Assert.equals(9, G1<Unit>.a)
    Assert.equals(10, G1<Unit>.b)
    Assert.equals(11, G2<Unit>.x)
    Assert.equals(12, G2<Unit>.y)
    Assert.equals(9, S1.a)
    Assert.equals(10, S1.b)
    Assert.equals(15, S2.x)
    Assert.equals(16, S2.y)
}
