
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_a03_01

  @Level:         1

  @Assertion:   4.7(3) The control transfer expressions are:
                • break
                • continue
                • return
                • throw
  @Description: Test containing all the control transfer expressions. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var s = ""
var i = 0

func f(b : Bool) {
    if (b) {
        s += "r"
        return
    }
    s += "f"
    try {
        g(i % 3 == 0)
    } catch (_) { }
}

func g(b : Bool) {
    if (b) {
        s += "t"
        throw Exception()
    }
    s += "g"
}

main() {
    for (_ in 0..10) {
        i++
        if (i == 10) {
            s += "b"
            break
        }
        f(i % 2 == 0)
        if (i == 5) {
            s += "c"
            continue
        }
        i++
    }
    Assert.equals("fgftfgcrrb", s)
}
