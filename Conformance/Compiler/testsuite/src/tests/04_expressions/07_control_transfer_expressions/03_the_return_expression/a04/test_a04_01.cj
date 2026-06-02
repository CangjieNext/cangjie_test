
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_03_a04_01

  @Level:         1

  @Assertion:   4.7.3(4) It provides a flexible control transfer from the callee to the function caller, i.e., the
                callee can terminate the function and return the value in the middle of the function body rather than
                always at the end.
  @Description: Check returning at the end and in the middle of the function.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func f(b : Bool) {
    if (b) {
        return 1
    }
    return 0
}

main() {
    Assert.equals(0, f(false))
    Assert.equals(1, f(true))
}
