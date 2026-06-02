/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_12_a04_01

  @Level:         1

  @Assertion: 4.12(4)
              Examples of parenthesized expressions:

              1 + 2 * 3 - 4 // The result is 3.
              (1 + 2) * 3 - 4 // The result is 5.

  @Description: Check the examples provided.

  @Mode: run

  @Negative: no
*/

import utils.assert.Assert

main() {
    let x = 1 + 2 * 3 - 4
    Assert.equals(3, x)

    let y = (1 + 2) * 3 - 4
    Assert.equals(5, y)
}

