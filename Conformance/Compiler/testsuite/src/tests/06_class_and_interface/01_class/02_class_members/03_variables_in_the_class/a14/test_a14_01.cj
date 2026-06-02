/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a14_01

  @Level:         1

  @Assertion: 6.1.2.3(14)
              If a variable in a class is modified with static, it is a static variable of the class.

  @Description: Check that member variables modified with the 'static' modifier
                are static and can be accessed through the type name

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Test {
    static public var s1 = 2
    static public let s2 = 4
    static protected var s3 = 8
    static protected let s4 = 16
    static private var s5 = 32
    static private let s6 = 64
    static var s7 = 128
    static let s8 = 256

    func test() {
        // Check access for reading
        let t1 = Test.s1
        Assert.equals(2, t1)
        let t2 = Test.s2
        Assert.equals(4, t2)
        let t3 = Test.s3
        Assert.equals(8, t3)
        let t4 = Test.s4
        Assert.equals(16, t4)
        let t5 = Test.s5
        Assert.equals(32, t5)
        let t6 = Test.s6
        Assert.equals(64, t6)
        let t7 = Test.s7
        Assert.equals(128, t7)
        let t8 = Test.s8
        Assert.equals(256, t8)


        // Check access for writing
        Test.s1 = 3
        Test.s3 = 81
        Test.s5 = 729
        Test.s7 = 6561

        Assert.equals(3, Test.s1)
        Assert.equals(81, Test.s3)
        Assert.equals(729, Test.s5)
        Assert.equals(6561, Test.s7)
    }
}

main() {
    Test().test()
}