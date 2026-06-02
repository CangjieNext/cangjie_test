/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_a01_05

  @Level:         1

  @Assertion: 4.4.1(1) The Cangjie programming language supports a rich set of patterns as follows:
                  1. constant patterns.
                  2. wildcard pattern.
                  3. binding patterns.
                  4. tuple patterns.
                  5. type patterns.
                  6. enum patterns.

  @Description: Checks compilation of a program with match expression with type patterns.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

open class A {}
class B <: A {}

main() {
    let l1 = 1
    var m = match (l1) {
        case _: Int64  => 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l2 = B()
    m = match (l2) {
        case _: A => 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l3: Float64 = 0.1
    var m2 = match (l3) {
        case f: Float64 => f
        case _ => 0.2
    }
    Assert.equals(0.1, m2)

    return
}
