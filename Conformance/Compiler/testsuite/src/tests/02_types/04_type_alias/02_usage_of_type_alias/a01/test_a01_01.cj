/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_04_02_a01_01

  @Level:         1

  @Assertion:    2.4.2(1) It can be used as a type.
 
  @Description:  Check that the allias can be used as a type

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

type s = S
type e = E
type i = I
type c = C

struct S {}
enum E { A }
interface I {}
open class C <: i {}


main(): Unit {
    let a1 = s()
    var a2 = e.A
    let a3 = c()

    Assert.isTrue(a1 is S)
    Assert.isTrue(a2 is E)
    Assert.isTrue(a3 is C)
    Assert.isTrue(a3 is I)
}
