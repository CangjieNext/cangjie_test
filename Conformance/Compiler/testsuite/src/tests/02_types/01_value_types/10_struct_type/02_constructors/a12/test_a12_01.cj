/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a12_01

  @Level:         1

  @Assertion: 2.1.10.2(12)
              The syntax of the member variable parameter is the same as that
              defined outside the primary constructor.

  @Description: Check the correct variants of syntax for member variable parameters

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

struct Test {
    Test(
        public let fhofw: Int64,
        public var HFhoe: Float64,
        private let NFnyirq: (Int64) -> Int64,
        private var NFqurq84: Rune,
        let fh9YR9: Unit,
        var FnquRY38: Array<Int64>
    ) {}

    func check() {
        Assert.equals(89, fhofw)
        Assert.approxEquals(123.3141, HFhoe)
        Assert.equals(100, NFnyirq(99))
        Assert.equals(r'f', NFqurq84)
        Assert.isTrue(fh9YR9 is Unit)
        Assert.equals([41, 5, 1, 543], FnquRY38)
    }
}

main() {
    let test = Test(89, 123.3141, {x: Int64 => x + 1}, r'f', (), [41, 5, 1, 543])
    test.check()
}