/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a04_01

  @Level:         1

  @Assertion: 5.6(4) Variables can be captured in the following scenarios:

              * Capturing variables declared by let: The values of these variables cannot be modified in closures.

  @Description: Check capturing of variable declared by let.

  @Mode: run

  @Negative: no
*/

import utils.assert.Assert

main() {
    let x = 2
    let y = 3

    func foo() {
        x * y
    }
    Assert.equals(6, foo())

    var bar = { => x * y }
    Assert.equals(6, bar())
}

