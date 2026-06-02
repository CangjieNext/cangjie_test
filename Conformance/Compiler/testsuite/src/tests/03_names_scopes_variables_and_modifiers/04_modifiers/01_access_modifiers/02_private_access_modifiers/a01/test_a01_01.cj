/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         03_04_01_02_a01_01

  @Level:         1
  @Assertion:    3.4.1.2(1) The private access modifier private is the most restrictive access level.
                 Members declared as private can only be accessed within the current scope.

  @Description:  Checks private members can be accessed inside the class

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import utils.assert.Assert

class A {
    private var str1: String = "bla-bla-string"
    private static let letInt64: Int64 = 0

    let e = { =>
        Assert.equals(0, letInt64, reason: "Private members should be accessible from same class")
    }

    private func funcFloat1(): Float32 {
        3.1415
    }

    func testPrivate() {
        Assert.equals(0, letInt64, reason: "Private members should be accessible from same class")
        Assert.equals("bla-bla-string", str1, reason: "Private members should be accessible from same class")
        Assert.equals(3.1415, funcFloat1(), reason: "Private members should be accessible from same class")

        func inner() {
            Assert.equals(0, letInt64, reason: "Private members should be accessible from inner func of same class")
            Assert.equals("bla-bla-string", str1, reason: "Private members should be accessible from same class")
            Assert.equals(3.1415, funcFloat1(), reason: "Private members should be accessible from same class")
            e()
        }

        inner()
    }
}

main() {
    A().testPrivate()
    0
}
