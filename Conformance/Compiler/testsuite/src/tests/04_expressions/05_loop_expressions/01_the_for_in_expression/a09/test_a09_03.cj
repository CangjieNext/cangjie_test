/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a09_03

  @Level:         1

  @Assertion: 4.5.1(9) We can use pattern to match the elements of the iteration, and
              if the match is successful (if patternGuard exists, the condition of patternGuard must
              also be satisfied), then execute the loop body block, and then recall next() at the
              beginning to continue the loop, the loop terminates when next() returns None.
  @Description: Checks that in case of loop with pattern guard, loop body is executed only when
                guard condition is satisfied.
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

main() {
    var sum: Int64 = 0

    for (i in 1..5 where i % 2 == 0) {
        sum += i
    }

    Assert.equals(6, sum)
}
