/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_11_a01_01

  @Level:         1

  @Assertion: 4.11(1)
              The synchronized expression is used in synchronization mechanisms, see the Concurrency section for
              details.

  @Description: Check synchronized expression usage.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

import std.sync.*

main() {
    var x = 1

    let m = Mutex()

    // Usage of synchronized expression. Meaning is not important in this test.
    synchronized (m) {
        x = 2
    }

    Assert.equals(2, x)
}

