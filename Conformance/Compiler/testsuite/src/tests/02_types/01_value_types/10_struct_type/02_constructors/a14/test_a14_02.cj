/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a14_02

  @Level:         1

  @Assertion: 2.1.10.2(14)
              The members in the primary constructor can also be modified by using public or private.
              See Access Modifiers for details

  @Description: Check that member variable parameters in the primary constructor
                modified with 'public' or no modifier
                create variables that are visible inside the package.

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

struct Test {
    Test(
        public var p1: Int64,
        public let p2: String,
        var p3: () -> Int64,
        let p4: Array<Int64>,
        public var np1!: Int64,
        public let np2!: String,
        var np3!: () -> Int64,
        let np4!: Array<Int64>
    ) {}
}

main() {
    let tst = Test(15, "eqp", {=> return 55}, [1, 2, 9],
        np1: 111, np2: "YY", np3: {=> -1}, np4: [0, 0, 0])

    Assert.equals(15, tst.p1)
    Assert.equals("eqp", tst.p2)
    Assert.equals(55, tst.p3())
    Assert.equals([1, 2, 9], tst.p4)
    Assert.equals(111, tst.np1)
    Assert.equals("YY", tst.np2)
    Assert.equals(-1, tst.np3())
    Assert.equals([0, 0, 0], tst.np4)
}