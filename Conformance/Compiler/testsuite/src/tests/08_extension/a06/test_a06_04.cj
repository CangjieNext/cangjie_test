/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a06_04

  @Level:         1

  @Assertion:   8(6) Features that can be added include: Adding Static Member Properties.

  @Description: Checks that static member properties can be added to standard type extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue: 6124


*/

import utils.assert.Assert

extend Int64 {
    static prop vProp: Int32 {
        get() { Int32(10) }
    }
}

main() {
    let x = Int64.vProp
    Assert.equals(10, x)
    Assert.isTrue(x is Int32)
}
