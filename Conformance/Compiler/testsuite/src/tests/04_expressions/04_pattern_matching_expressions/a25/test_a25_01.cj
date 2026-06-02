/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a25_01

  @Level:         1

  @Assertion: 4.4(25) otherwise check types as below; When the context does not require some specific type, assuming
              that the branch types of the match expression are T1, ..., Tn, then the type of the match expression is
              the least common supertype T of T1, ..., Tn.
  @Description: Checks that the match expression is least common supertype T of T1, ..., Tn
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var r = Assert.getRuntimeZero()

open class A {}
open class B <: A {}
class C <: A {}
class D <: B {}

main() {
    var m1 = match (r) {
        case 0 => A()
        case 1 => B()
        case 2 => C()
        case _ => D()
    }
    println(m1 is A);
    Assert.isTrue(m1 is A)

    var m2 = match {
        case r == 0 => A()
        case r == 1 => B()
        case r == 2 => C()
        case _ => D()
    }
    println(m2 is A);
    Assert.isTrue(m2 is A)

    return
}
