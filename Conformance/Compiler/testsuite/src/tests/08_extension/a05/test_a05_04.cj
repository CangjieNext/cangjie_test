/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a05_04

  @Level:         1

  @Assertion:   8(5) Features that can be added include: Adding Instance Member Properties.

  @Description: Checks that instance member properties can be added to standard type extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue: 6124


*/

import utils.assert.Assert

extend Int64 {
    prop asInt32: Int32 {
        get() { Int32(this) }
    }
}

main() {
    let x = 15.asInt32
    Assert.equals(15, x)
    Assert.isTrue(x is Int32)
}
