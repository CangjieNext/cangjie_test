/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_a01_03

  @Level:         1

  @Assertion: 4.4.1(1) The Cangjie programming language supports a rich set of patterns as follows:
                  1. constant patterns.
                  2. wildcard pattern.
                  3. binding patterns.
                  4. tuple patterns.
                  5. type patterns.
                  6. enum patterns.

  @Description: Checks compilation of a program with match expression with binding patterns.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let l1 = 3
    var m = match (l1) {
        case 1 => 1
        case a => a - 1
    }
    Assert.equals(2, m)

    let l2 = 2
    m = match (l2) {
        case 1 => 1
        case b => 2
    }
    Assert.equals(2, m)

    return
}
