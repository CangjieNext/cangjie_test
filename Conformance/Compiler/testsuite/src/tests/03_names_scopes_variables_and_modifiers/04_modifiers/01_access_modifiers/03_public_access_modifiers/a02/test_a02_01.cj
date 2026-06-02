/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         03_04_01_03_a02_01

  @Level:         1
  @Assertion:    3.4.1.3(2) Note: public-modified top-level members are also accessible outside the package.

  @Description:  Test for various structures with public modifier

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: aux_test_a02.cj

*/

package pkg2

import pkg1.*
import utils.assert.Assert

main() {
    Assert.equals(0, v1, reason: "Int value must match")
    Assert.equals(10.1, l1, reason: "Float value must match")
    let a: A = A()
    Assert.equals("0", a.str, reason: "Str member value must match")
    Assert.equals(false, a.a, reason: "Bool member value must match")
    a.foo(); // this call should be successful
    let ca: ChildA = ChildA()
    Assert.equals("0", ca.str, reason: "Str member value must match")
    Assert.equals("0", ca.func1(), reason: "func1() Str member value must match")
}
