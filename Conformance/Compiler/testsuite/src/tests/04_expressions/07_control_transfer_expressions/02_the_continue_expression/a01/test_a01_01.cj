
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_02_a01_01

  @Level:         1

  @Assertion:   4.7.2(1) A continue expression can only be used in loop bodies.
  @Description: Checks continue break is allowed inside all kinds of loops.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

func f(n : Nothing) { }

main() {
    var i = 0
    do {
        i++
        while (i % 10 != 9) {
            for (_ in 0..10) {
                continue
            }
            i++
            f(continue)
        }
        var n = continue
    } while (i < 100)
    Assert.equals(109, i)
}
