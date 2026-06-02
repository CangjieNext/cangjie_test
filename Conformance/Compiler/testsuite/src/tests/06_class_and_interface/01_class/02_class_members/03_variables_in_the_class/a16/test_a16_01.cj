/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a16_01

  @Level:         1

  @Assertion: 6.1.2.3(16)
              Static variables are inherited by subclasses,
              and the static variables of subclasses and parent classes are the same.

  @Description: Check that inherited static member variables are members of the child class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

open class Open {
    static public var s1 = 1
    static public let s2 = 2
    static protected var s3 = 3
    static protected let s4 = 4
    static var s5 = 5
    static let s6 = 6
}

class Test1 <: Open {
    // Check that variables are directly accessible by name
    static func test() {
        let t1 = s1
        Assert.equals(1, t1)
        let t2 = s2
        Assert.equals(2, t2)
        let t3 = s3
        Assert.equals(3, t3)
        let t4 = s4
        Assert.equals(4, t4)
        let t5 = s5
        Assert.equals(5, t5)
        let t6 = s6
        Assert.equals(6, t6)
    }
}

abstract class Abstract {
    static public var s1 = 10
    static public let s2 = 20
    static protected var s3 = 30
    static protected let s4 = 40
    static var s5 = 50
    static let s6 = 60
}

class Test2 <: Abstract {
    // Check that variables are directly accessible by name
    static func test() {
        let t1 = s1
        Assert.equals(10, t1)
        let t2 = s2
        Assert.equals(20, t2)
        let t3 = s3
        Assert.equals(30, t3)
        let t4 = s4
        Assert.equals(40, t4)
        let t5 = s5
        Assert.equals(50, t5)
        let t6 = s6
        Assert.equals(60, t6)
    }
}

sealed abstract class Sealed {
    static public var s1 = 100
    static public let s2 = 200
    static protected var s3 = 300
    static protected let s4 = 400
    static var s5 = 500
    static let s6 = 600
}

class Test3 <: Sealed {
    // Check that variables are directly accessible by name
    static func test() {
        let t1 = s1
        Assert.equals(100, t1)
        let t2 = s2
        Assert.equals(200, t2)
        let t3 = s3
        Assert.equals(300, t3)
        let t4 = s4
        Assert.equals(400, t4)
        let t5 = s5
        Assert.equals(500, t5)
        let t6 = s6
        Assert.equals(600, t6)
    }
}

main() {
    // Check access by the child's class name
    // Inheritance from open
    Test1.test()

    // reading
    let o1 = Test1.s1
    Assert.equals(1, o1)
    let o2 = Test1.s2
    Assert.equals(2, o2)
    let o3 = Test1.s3
    Assert.equals(3, o3)
    let o4 = Test1.s4
    Assert.equals(4, o4)
    let o5 = Test1.s5
    Assert.equals(5, o5)
    let o6 = Test1.s6
    Assert.equals(6, o6)

    // writing
    Test1.s1 = -1
    Test1.s3 = -2
    Test1.s5 = -3
    Assert.equals(-1, Test1.s1)
    Assert.equals(-2, Test1.s3)
    Assert.equals(-3, Test1.s5)

    // Inheritance from abstract
    Test2.test()

    // reading
    let a1 = Test2.s1
    Assert.equals(10, a1)
    let a2 = Test2.s2
    Assert.equals(20, a2)
    let a3 = Test2.s3
    Assert.equals(30, a3)
    let a4 = Test2.s4
    Assert.equals(40, a4)
    let a5 = Test2.s5
    Assert.equals(50, a5)
    let a6 = Test2.s6
    Assert.equals(60, a6)

    // writing
    Test2.s1 = -10
    Test2.s3 = -20
    Test2.s5 = -30
    Assert.equals(-10, Test2.s1)
    Assert.equals(-20, Test2.s3)
    Assert.equals(-30, Test2.s5)

    // Inheritance from sealed
    Test3.test()

    // reading
    let s1 = Test3.s1
    Assert.equals(100, s1)
    let s2 = Test3.s2
    Assert.equals(200, s2)
    let s3 = Test3.s3
    Assert.equals(300, s3)
    let s4 = Test3.s4
    Assert.equals(400, s4)
    let s5 = Test3.s5
    Assert.equals(500, s5)
    let s6 = Test3.s6
    Assert.equals(600, s6)

    // writing
    Test3.s1 = -100
    Test3.s3 = -200
    Test3.s5 = -300
    Assert.equals(-100, Test3.s1)
    Assert.equals(-200, Test3.s3)
    Assert.equals(-300, Test3.s5)
}