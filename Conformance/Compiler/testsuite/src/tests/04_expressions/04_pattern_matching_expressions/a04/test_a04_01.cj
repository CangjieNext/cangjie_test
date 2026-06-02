/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a04_01

  @Level:         1

  @Assertion: 4.4(4) There are only two matching results, i.e., succeed or fail.
  @Description: Checks pattern matching result succeed.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let l1 = 1;
    var m1 = match (l1) {
        case 1 => "succeed"
        case _ => "fail"
    }
    Assert.equals("succeed", m1)

    return
}
