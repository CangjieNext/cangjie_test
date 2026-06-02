/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a10_01

  @Level:         1

  @Assertion: 2.1.10.2(10)
              In addition, it indicates the semantics of assigning value to member variable through the parameter.

  @Description: Check that a constructed instance member variable is set to
                the value that was passed to the corresponding member variable parameter
                during the primary constructor invocation

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: In the assertion "it" is a member variable parameter

*/

import utils.assert.Assert

struct Test {
    Test(
        // Unnamed parameters of all types of modifiers
        public let    a: Int64,
        public var    b: Bool,
        private let   c: Float64,
        private var   d: Int64,
        let           e: String,
        var           f: Rune,

        // Named parameters of all types of modifiers
        public let    na!: Int64,
        public var    nb!: Bool,
        private let   nc!: Float64,
        private var   nd!: Int64,
        let           ne!: String,
        var           nf!: Rune
    ) {}

    func check_private(tst: Test) {
        Assert.approxEquals(1.15, tst.c)
        Assert.equals(89, tst.d)

        Assert.approxEquals(0.0000009, tst.nc)
        Assert.equals(14, tst.nd)
    }
}

main() {
    let tst = Test(10, false, 1.15, 89, "eq", r'v', 
        na: 897, nb: true, nc: 0.0000009, nd: 14, ne: "ff", nf: r';')

    Assert.equals(10, tst.a)
    Assert.equals(false, tst.b)
    Assert.equals("eq", tst.e)
    Assert.equals(r'v', tst.f)

    Assert.equals(897, tst.na)
    Assert.equals(true, tst.nb)
    Assert.equals("ff", tst.ne)
    Assert.equals(r';', tst.nf)

    tst.check_private(tst)
}
