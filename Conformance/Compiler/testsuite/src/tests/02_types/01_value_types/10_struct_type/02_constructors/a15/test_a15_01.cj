/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a15_01

  @Level:         1

  @Assertion: 2.1.10.2(15)
              In the primary constructor, only non-static member variable declarations can be written.

  @Description: Check that variables generated from member variable parameters
                are instance variables, i.e. are accessible through an instance object

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006183

*/

import utils.assert.Assert

struct Test {
    Test(
        public var p1: Int64,
        public let p2: Int64,
        private var p3: Int64,
        private let p4: Int64,
        var p5: Int64,
        let p6: Int64,
        public var p7!: Int64,
        public let p8!: Int64,
        private var p9!: Int64,
        private let p10!: Int64,
        var p11!: Int64,
        let p12!: Int64
    ) {}

    func check(tst: Test) {
        Assert.equals(1, tst.p1)
        Assert.equals(2, tst.p2)
        Assert.equals(3, tst.p3)
        Assert.equals(4, tst.p4)
        Assert.equals(5, tst.p5)
        Assert.equals(6, tst.p6)
        Assert.equals(7, tst.p7)
        Assert.equals(8, tst.p8)
        Assert.equals(9, tst.p9)
        Assert.equals(10, tst.p10)
        Assert.equals(11, tst.p11)
        Assert.equals(12, tst.p12)
    }
}

main() {
    let tst = Test(1, 2, 3, 4, 5, 6, p7: 7, p8: 8, p9: 9, p10: 10, p11: 11, p12: 12)
    tst.check(tst)
}