/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a07_01

  @Level:         1

  @Assertion: 5.6(7) Capturing variables declared by var: The function or lambda that captures mutable variables can 
              only be invoked and cannot be used as a first-class citizen, including cannot be assigned to a variable, 
              cannot be used as an argument or return value, cannot be used as an expression. 

  @Description: Check that function or lambda that captures mutable variables can be invoked.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    var x = 3

    func foo() {
        x * 2
    }

    Assert.equals(6, foo())
    Assert.equals(6, { => x * 2}())
}

