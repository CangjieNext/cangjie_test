/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a19_01

  @Level:         1

  @Assertion: 4.4(19)  Once the value of the current expression is true, the code after => is executed, 
              and remaining cases will not be evaluated.
  @Description: Checks that the code foo(3) after => is executed
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
    var m = match (expr) {
        case 1 => foo(1)
        case 2 => foo(2)
        case _ => foo(3)
    }
    Assert.equals(3, m)
    Assert.equals("3", s);

    return
}
