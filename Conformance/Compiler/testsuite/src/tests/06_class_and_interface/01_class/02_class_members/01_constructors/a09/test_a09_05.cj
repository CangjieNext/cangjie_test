/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a09_05

  @Level:         1

  @Assertion: 6.1.2.1(9)
              The member variable parameter is introduced to reduce code redundancy.
              Defines a member variable parmeter, including the definitions of both a parameter
              and a member variable.

  @Description: Check that member variable parameters modified with var generate
                mutable class memeber variables

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006183

*/

import utils.assert.Assert

class A {
  A(
    public var pub_mut_unnamed: Int64,
    protected var prot_mut_unnamed: String,
    private var priv_mut_unnamed: Bool,
    var mut_unnamed: Rune,
    public var pub_mut_named!: Float64,
    protected var prot_mut_named!: () -> Int64,
    private var priv_mut_named!: Range<Int64>,
    var mut_named!: Array<Int64>
  ) {}

  func rewrite() {
    pub_mut_unnamed = 10
    prot_mut_unnamed = "string"
    priv_mut_unnamed = false
    mut_unnamed = r'o'
    pub_mut_named = 0.416874e-99
    prot_mut_named = { => 25}
    priv_mut_named = 1..100:2
    mut_named = [0, 0, 0, 0, 0]
  }

  func check_after_rewrite() {
    Assert.equals(10, pub_mut_unnamed)
    Assert.equals("string", prot_mut_unnamed)
    Assert.equals(false, priv_mut_unnamed)
    Assert.equals(r'o', mut_unnamed)

    Assert.approxEquals(0.416874e-99, pub_mut_named)
    Assert.equals(25, prot_mut_named())
    Assert.equals(1..100:2, priv_mut_named)
    Assert.equals([0, 0, 0, 0, 0], mut_named)
  }
}

main() {
  let a = A(1, "1", true, r'1', pub_mut_named: 1.0, prot_mut_named: {=> 1}, priv_mut_named: 1..3:1, mut_named: [1])
  a.rewrite()
  a.check_after_rewrite()
}