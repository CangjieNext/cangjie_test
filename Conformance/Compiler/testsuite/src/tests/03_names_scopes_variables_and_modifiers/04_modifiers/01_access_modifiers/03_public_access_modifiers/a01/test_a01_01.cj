/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         03_04_01_03_a01_01

  @Level:         1
  @Assertion:    3.4.1.3(1) The public access modifier public is the most lenient
                 access level. Members declared as public are accessible in all scopes.

  @Description:  Test for various structures with public modifier

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: aux_test_a01.cj

*/

package pkg2

import pkg1.*
import utils.assert.Assert

class ImplI1 <: I1 {
    public func f1(): Int32 {
        return 666
    }
}

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
    let s: Struct = Struct()
    Assert.equals(10, s.width1, reason: "Struct Int value must match")

    let e: AAA = AAA.AAA1
    Assert.equals(0, f2(), reason: "f2() value must match")
    let aa: A = AliasA()
}
