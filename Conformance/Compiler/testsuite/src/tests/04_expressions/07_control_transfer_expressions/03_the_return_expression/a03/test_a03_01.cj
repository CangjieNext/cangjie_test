
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_03_a03_01

  @Level:         1

  @Assertion:   4.7.3(3) It terminates the execution of the function immediately.
  @Description: Check that return terminates the execution of the function.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var s = ""

func f(b : Bool) {
    s = ""
    if (b) {
        return
    }
    s = "f"
}

func g(b : Bool) {
    s = ""
    if (b) {
        return
    }
    s = "g"
}

main() {
    f(false)
    Assert.equals("f", s)
    f(true)
    Assert.equals("", s)
    g(false)
    Assert.equals("g", s)
    g(true)
    Assert.equals("", s)
}
