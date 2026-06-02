/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a20_01

  @Level:         1

  @Assertion: 4.4(20)  Actually, the match expression without selector is a concise form of a series of nested if-else
              if expressions.
  @Description: Checks that the result of the match expression without selector is equal to the result of a concise
                form of a series of nested if-else if expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var r = Assert.getRuntimeZero() + 3
var s = ""

func foo(e: Int64): Int64 {
  s += e.toString()
  return e
}

main() {
    var m1 = match {
        case r == foo(1) => 1
        case r == foo(2) => 2
        case r == foo(3) => 3
        case _ => 4
    }

    var s1 = s.toString(); s = ""
    var m2 = if (r == foo(1)) {
        1
    } else if (r == foo(2)) {
        2
    } else if (r == foo(3)) {
        3
    } else {
        4
    }

    Assert.equals(m1, m2)
    Assert.equals(s1, s)
    return
}
