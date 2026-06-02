/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_03_a06_01

  @Level:         1

  @Assertion: 4.4.1.3(6) The variable specified in the binding pattern have a scope from its first occurrence to
              the next case.

  @Description: Checks that the variable specified in the binding pattern is acceccible from its first occurrence to
                the next case.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var v = 1
    var m = match (v) {
        case 0 => 1
        case foo => let a = foo
            let b = foo + a
            v = a + b + foo
            foo
        case _ => 0
    }
    Assert.equals(1, m)
    Assert.equals(4, v)
    return
}
