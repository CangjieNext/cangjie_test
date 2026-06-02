/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a01_01

  @Level:         1

  @Assertion: 5.6(1) A closure is a self-contained function or lambda. A closure can capture variables from the static 
              scope that defines it. 

  @Description: Check closures examples.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    // Self-contained function with variable capture.
    var x = 3
    func foo() {
        x * 2
    }
    Assert.equals(6, foo())

    // Self-contained lambda with variable capture.
    let y = 3
    var bar = { => y * 3 }
    Assert.equals(9, bar())
}

