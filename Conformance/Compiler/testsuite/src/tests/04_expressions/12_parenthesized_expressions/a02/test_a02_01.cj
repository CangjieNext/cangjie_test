/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_12_a02_01

  @Level:         1

  @Assertion: 4.12(2)
              Subexpressions in parentheses are considered as a separate evaluation Unit.

  @Description: Check that subexpressions in parentheses are a separate evaluation unit.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    // (1 + 2) are evaluated separately.
    let x = (1 + 2) * 3
    Assert.equals(9, x)
}

