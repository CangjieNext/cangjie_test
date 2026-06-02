/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_03_a02_01

  @Level:         1

  @Assertion: 4.4.1.3(2) Unlike the wildcard pattern, a binding pattern binds the matched value to a variable
              specified in the binding pattern, which can be accessed in the expression after =>.

  @Description: Checks that the variable in the binding pattern is accessible
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var z = Assert.getRuntimeZero()

main() {
    let l1 = z
    var m = match (l1) {
        case foo => foo + 1
    }
    Assert.equals(1, m)
    return
}
