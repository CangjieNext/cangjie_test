/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a07_01

  @Level:         1

  @Assertion: 4.4(7) For the match expression with a selector, the expression after the keyword match is the selector 
              to be matched.
  @Description: Checks that the expression after the keyword match is matched.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let selector = 1;
    var m = match (selector) {
        case 1 => "1"
        case _ => "fail"
    }
    Assert.equals("1", m);

    return
}
