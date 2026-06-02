/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a03_01

  @Level:         1

  @Assertion: 4.4(3) Pattern matching is to decide whether a given instance
              belongs to the set.
  @Description: Checks pattern matching.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let l1 = 1;
    var m1 = match (l1) {
        case 1 | 2 | 3 => "one"
        case _ => "fail"
    }
    Assert.equals("one", m1)

    let l2 = 0;
    var m2 = match (l2) {
        case 1 | 2 | 3 => "one"
        case _ => "fail"
    }
    Assert.equals("fail", m2)

    return
}
