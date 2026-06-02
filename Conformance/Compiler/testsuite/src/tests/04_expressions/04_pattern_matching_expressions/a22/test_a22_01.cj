/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a22_01

  @Level:         1

  @Assertion: 4.4(22)  The compiler will try to do an exhaustive check, and if it cannot determine this,
              it will report an error and prompt for a case _.
  @Description: Checks that exhaustive check is successfull for matchine expression.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

enum E {A | B}

var r: E = A

main() {
    var m = match (r) {
        case A => 1
        case B => 2
    }
    Assert.equals(1, m)

    return
}
