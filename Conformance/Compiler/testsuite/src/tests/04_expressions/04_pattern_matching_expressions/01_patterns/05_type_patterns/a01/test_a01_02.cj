/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_05_a01_02

  @Level:         1

  @Assertion: 4.4.1.5(1) Type patterns are primarily used to check and/or cast the type of certain variable.

  @Description: Checks that type patterns can be uses to cast type of some of the examples of an variable type.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

open class A {}
open class B <: A {}
class C <: B {}

main() {
    var v1: B = B()
    Assert.isTrue(match(v1) {
        case foo: A => Assert.isTrue(foo is A); true
        case _ => false
    })
    var v2: C = C()
    Assert.isTrue(match(v2) {
        case foo: A => Assert.isTrue(foo is A); true
        case _ => false
    })
    Assert.isTrue(match(v2) {
        case foo: B  => Assert.isTrue(foo is B); true
        case _ => false
    })
    return
}
