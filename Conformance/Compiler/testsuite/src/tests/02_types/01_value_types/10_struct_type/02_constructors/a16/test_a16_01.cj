/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a16_01

  @Level:         1

  @Assertion: 2.1.10.2(16)
              The member variable defined in the primary constructor
              cannot have the same name as those outside the primary constructor.

  @Description: Check that member variable parameters can be defined alongside
                other member variables if they have different names

  @Mode: run

  @Negative: no

  @Structure: single


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
        public var np1!: Int64,
        public let np2!: Int64,
        private var np3!: Int64,
        private let np4!: Int64,
        var np5!: Int64,
        let np6!: Int64
    ) {}

    public var _p1: Int64 = 13
    public let _p2: Int64 = 14
    private var _p3: Int64 = 15
    private let _p4: Int64 = 16
    var _p5: Int64 = 17
    let _p6: Int64 = 18
    public var _np1: Int64 = 19
    public let _np2: Int64 = 20
    private var _np3: Int64 = 21
    private let _np4: Int64 = 22
    var _np5: Int64 = 23
    let _np6: Int64 = 24

    func check() {
        Assert.equals(1, p1)
        Assert.equals(2, p2)
        Assert.equals(3, p3)
        Assert.equals(4, p4)
        Assert.equals(5, p5)
        Assert.equals(6, p6)
        Assert.equals(7, np1)
        Assert.equals(8, np2)
        Assert.equals(9, np3)
        Assert.equals(10, np4)
        Assert.equals(11, np5)
        Assert.equals(12, np6)

        Assert.equals(13, _p1)
        Assert.equals(14, _p2)
        Assert.equals(15, _p3)
        Assert.equals(16, _p4)
        Assert.equals(17, _p5)
        Assert.equals(18, _p6)
        Assert.equals(19, _np1)
        Assert.equals(20, _np2)
        Assert.equals(21, _np3)
        Assert.equals(22, _np4)
        Assert.equals(23, _np5)
        Assert.equals(24, _np6)
    }
}

main() {
    let t = Test(1, 2, 3, 4, 5, 6, np1: 7, np2: 8, np3: 9, np4: 10, np5: 11, np6: 12)
    t.check()
}