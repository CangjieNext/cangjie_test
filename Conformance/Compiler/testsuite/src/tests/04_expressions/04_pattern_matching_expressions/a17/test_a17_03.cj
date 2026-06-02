/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a17_03

  @Level:         1

  @Assertion: 4.4(17) For match expressions without selector, there is no expression after the keyword match, and
              for each case in {}, there can only be one expression of type Bool between the keyword case and => 
              (or the wildcard _, which means always true).
  @Description: Checks matching expression without selected that has the  wildcard _ between the keyword case and =>.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var expr = Assert.getRuntimeZero()

main() {
    var m = match {
        case _ => 1
    }
    Assert.equals(1, m);

    return
}
