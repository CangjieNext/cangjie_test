/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a02_01

  @Level:         1

  @Assertion: 5.6(2) You can access the variables, even if the original scope that defined the variables no 
              longer exists.

  @Description: Check access the variables when the original scope that defined the variable no longer exists.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

func foo() {
    let x = 3
    func f() {
        x * 2
    }
    return f
}

func bar() {
    let x = 3
    return { => x * 3 }
}

main() {
    var f = foo()
    Assert.equals(6, f())

    var g = bar()
    Assert.equals(9, g())
}

