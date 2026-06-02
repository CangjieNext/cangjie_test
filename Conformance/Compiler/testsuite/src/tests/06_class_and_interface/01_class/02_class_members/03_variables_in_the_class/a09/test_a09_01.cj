/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a09_01

  @Level:         1

  @Assertion: 6.1.2.3(9)
              A getter function can be declared
              through which a private variable can be accessed outside the class.

  @Description: Check that private mmeber variables can be accessed with the help of getter functions

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Test {
    private var m1 = 1
    private let m2 = 2
    static private var s1 = 3
    static private let s2 = 4

    // Ordinary functions
    func get_m1() {
        m1
    }

    func get_m2() {
        m2
    }

    static func get_s1() {
        s1
    }

    static func get_s2() {
        s2
    }

    // Generic functions
    func get_m1_generic<T>() {
        m1
    }

    func get_m2_generic<T>() {
        m2
    }

    static func get_s1_generic<T>() {
        s1
    }

    static func get_s2_generic<T>() {
        s2
    }

    init() {
        pm1 = { => m1 }
        pm2 = { => m2 }
    }

    // Public variables of a function type
    public var pm1: () -> Int64 = { => 0 }
    public var pm2: () -> Int64 = { => 0 }
    static public let ps1 = { => s1 }
    static public let ps2 = { => s2 }

    func change_vars() {
        m1 = 10
        s1 = 30
    }
}

main() {
    let obj = Test()
    Assert.equals(1, obj.get_m1())
    Assert.equals(2, obj.get_m2())
    Assert.equals(3, Test.get_s1())
    Assert.equals(4, Test.get_s2())

    Assert.equals(1, obj.get_m1_generic<Bool>())
    Assert.equals(2, obj.get_m2_generic<String>())
    Assert.equals(3, Test.get_s1_generic<Unit>())
    Assert.equals(4, Test.get_s2_generic<Float16>())

    Assert.equals(1, obj.pm1())
    Assert.equals(2, obj.pm2())
    Assert.equals(3, Test.ps1())
    Assert.equals(4, Test.ps2())

    // Check that getters return the actual values of variables
    obj.change_vars()

    Assert.equals(10, obj.get_m1())
    Assert.equals(2, obj.get_m2())
    Assert.equals(30, Test.get_s1())
    Assert.equals(4, Test.get_s2())

    Assert.equals(10, obj.get_m1_generic<Bool>())
    Assert.equals(2, obj.get_m2_generic<String>())
    Assert.equals(30, Test.get_s1_generic<Unit>())
    Assert.equals(4, Test.get_s2_generic<Float16>())

    Assert.equals(10, obj.pm1())
    Assert.equals(2, obj.pm2())
    Assert.equals(30, Test.ps1())
    Assert.equals(4, Test.ps2())
}