/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_14_a08_01

  @Level:         1

  @Assertion: 4.14(8) For the expression expr++ (or expr--), the following is specified:

              3. The type of expr++ (or expr--) is Unit.

  @Description: Check that type of expr++ and expr-- is Unit.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    var x: Int32 = 0
    var y: UInt32 = 0
}

main() {
    var counterI64: Int64 = 0
    var counterU64: UInt64 = 0
    Assert.isTrue(counterI64++ is Unit)
    Assert.isTrue(counterI64-- is Unit)
    Assert.isTrue(counterU64++ is Unit)
    Assert.isTrue(counterU64-- is Unit)

    var c = C()
    Assert.isTrue(c.x++ is Unit)
    Assert.isTrue(c.x-- is Unit)
    Assert.isTrue(c.y++ is Unit)
    Assert.isTrue(c.y-- is Unit)
}

