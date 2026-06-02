
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_a04_04

  @Level:         1

  @Assertion:   4.7(4) Control transfer expressions can become part of a more complex expression, but unreachable codes
                may be generated (reporting a warning at the unreachable code):
  @Description: Checks that a warning is reported due to an unreachable statement being present after throw.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var i = 0

func f() {
    for (_ in 0..10) {
        throw Exception()
        i++
    }
}

main() {
    try {
        f()
    } catch (_) {
        i += 100
    }
    Assert.equals(100, i)
}
