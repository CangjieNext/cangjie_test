/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a18_01

  @Level:         1

  @Assertion: 4.4(18) In the process of execution, the expression after case is evaluated one-by-one.
  @Description: Checks evaluation order of expressions after case.
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
        case _ => 4
    }
    Assert.equals(3, m)
    Assert.equals("123", s);

    return
}
