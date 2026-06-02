/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a27_01

  @Level:         1

  @Assertion: 4.4(27)  When the context does require a specific type, then all cases of the match expression must be a
              subtype of the specific type required by the context

  @Description: Checks that the match expression has the specified subtype.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var r = Assert.getRuntimeZero()

open class A {}
class B <: A {}
class C <: A {}

main() {
    var m1: A = match (r) {
        case 0 => A()
        case 1 => B()
        case _ => C()
    }

    Assert.isTrue(m1 is A)

    return
}
