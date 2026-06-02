/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_10_a01_01

  @Level:         1

  @Assertion: 4.10(1)
              The spawn expression is used to create and start a thread, see the Concurrent section for details.

  @Description: Check the spawn expression usage.
  
  @Mode: run

  @Negative: no

  @Issue: 0006081

*/

// NOTE: Spawn expressions should be covered by tests within "15. Concurrency" chapter. There is no sense to cover all
//       cases here.

import utils.assert.Assert

main() {
    var future = spawn {
        return 42
    }
    Assert.equals(42, future.get())
}

