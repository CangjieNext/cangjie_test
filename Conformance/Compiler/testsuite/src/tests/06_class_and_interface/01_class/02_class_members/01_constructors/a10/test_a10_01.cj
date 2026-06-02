/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a10_01

  @Level:         1

  @Assertion: 6.1.2.1(10)
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

class Test {
  Test(
    // Unnamed parameters of all types of modifiers
    public let    a: Int64,
    public var    b: Bool,
    protected let c: String,
    protected var d: Rune,
    private let   e: Float64,
    private var   f: Int64,
    let           g: String,
    var           h: Rune,

    // Named parameters of all types of modifiers
    public let    na!: Int64,
    public var    nb!: Bool,
    protected let nc!: String,
    protected var nd!: Rune,
    private let   ne!: Float64,
    private var   nf!: Int64,
    let           ng!: String,
    var           nh!: Rune
  ) {}

  func check_private(tst: Test) {
    Assert.approxEquals(1.15, tst.e)
    Assert.equals(89, tst.f)

    Assert.approxEquals(0.0000009, tst.ne)
    Assert.equals(14, tst.nf)
  }
}

main() {
  let tst = Test(10, false, "12", r'{', 1.15, 89, "eq", r'v', 
    na: 897, nb: true, nc: "[[[", nd: r'r', ne: 0.0000009, nf: 14, ng: "ff", nh: r';')

  Assert.equals(10, tst.a)
  Assert.equals(false, tst.b)
  Assert.equals("12", tst.c)
  Assert.equals(r'{', tst.d)
  Assert.equals("eq", tst.g)
  Assert.equals(r'v', tst.h)

  Assert.equals(897, tst.na)
  Assert.equals(true, tst.nb)
  Assert.equals("[[[", tst.nc)
  Assert.equals(r'r', tst.nd)
  Assert.equals("ff", tst.ng)
  Assert.equals(r';', tst.nh)

  tst.check_private(tst)
}
