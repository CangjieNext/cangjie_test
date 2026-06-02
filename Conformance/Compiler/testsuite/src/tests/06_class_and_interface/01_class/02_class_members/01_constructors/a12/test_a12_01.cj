/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a12_01

  @Level:         1

  @Assertion: 6.1.2.1(12)
              The syntax of the member variable parameter is the same as that
              defined outside the primary constructor.

  @Description: Check the correct variants of syntax for member variable parameters

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Test {
  Test(
    public let fhofw: Int64,
    public var HFhoe: Float64,
    protected let NFi_rqo: String,
    protected var JFnqiYR: (String, Bool),
    private let NFnyirq: (Int64) -> Int64,
    private var NFqurq84: Rune,
    let fh9YR9: Unit,
    var FnquRY38: Array<Int64>
  ) {}

  func check() {
    Assert.equals(89, fhofw)
    Assert.approxEquals(123.3141, HFhoe)
    Assert.equals("rqfa", NFi_rqo)
    Assert.equals("qrfq3ew", JFnqiYR[0])
    Assert.equals(false, JFnqiYR[1])
    Assert.equals(100, NFnyirq(99))
    Assert.equals(r'f', NFqurq84)
    Assert.isTrue(fh9YR9 is Unit)
    Assert.equals([41, 5, 1, 543], FnquRY38)
  }
}

main() {
  let test = Test(89, 123.3141, "rqfa", ("qrfq3ew", false), {x: Int64 => x + 1}, r'f', (), [41, 5, 1, 543])
  test.check()
}