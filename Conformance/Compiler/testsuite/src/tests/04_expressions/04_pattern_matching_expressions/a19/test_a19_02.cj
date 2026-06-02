/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a19_02

  @Level:         1

  @Assertion: 4.4(19)  Once the value of the current expression is true, the code after => is executed, 
              and remaining cases will not be evaluated.
  @Description: Checks that expression expr == foo(4) is not evaluated.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var expr = Assert.getRuntimeZero() + 3
var s = ""

func foo(e: Int64): Int64 {
  s += e.toString()
  return e
}

main() {
    var m = match {
        case expr == foo(1) => 1
        case expr == foo(2) => 2
        case expr == foo(3) => 3
        case expr == foo(4) => 4
        case _ => 5
    }
    Assert.equals(3, m)
    Assert.equals("123", s);

    return
}
