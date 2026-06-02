/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a14_01

  @Level:         1

  @Assertion: 2.1.10.2(14)
              The members in the primary constructor can also be modified by using public or private.
              See Access Modifiers for details

  @Description: Check that member variable parameters in the primary constructor
                can be modified with access modifiers or have no modifiers.
                Check that members with all types of modifiers are visible inside the struct.

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

struct Test {
    Test(
        public var p1: Int64,
        public let p2: String,
        private var p3: () -> Int64,
        private let p4: Array<Int64>,
        var p5: Int64,
        let p6: Bool,
        public var np1!: Int64,
        public let np2!: String,
        private var np3!: () -> Int64,
        private let np4!: Array<Int64>,
        var np5!: Int64,
        let np6!: Bool
    ) {}

    func check_visibility(tst: Test) {
        // Check visibility directly by name
        Assert.equals(1, p1)
        Assert.equals("tr", p2)
        Assert.equals(7, p3())
        Assert.equals([1, 9], p4)
        Assert.equals(98, p5)
        Assert.equals(false, p6)
        Assert.equals(8, np1)
        Assert.equals("", np2)
        Assert.equals(10, np3())
        Assert.equals([9, 7, 3], np4)
        Assert.equals(60, np5)
        Assert.equals(true, np6)

        // Check visibility through an instance name
        Assert.equals(1, tst.p1)
        Assert.equals("tr", tst.p2)
        Assert.equals(7, tst.p3())
        Assert.equals([1, 9], tst.p4)
        Assert.equals(98, tst.p5)
        Assert.equals(false, tst.p6)
        Assert.equals(8, tst.np1)
        Assert.equals("", tst.np2)
        Assert.equals(10, tst.np3())
        Assert.equals([9, 7, 3], tst.np4)
        Assert.equals(60, tst.np5)
        Assert.equals(true, tst.np6)
    }
}

main() {
    let tst = Test(1, "tr", {=> return 7}, [1, 9], 98, false,
        np1: 8, np2: "", np3: {=> 10}, np4: [9, 7, 3], np5: 60, np6: true)
        tst.check_visibility(tst)
}