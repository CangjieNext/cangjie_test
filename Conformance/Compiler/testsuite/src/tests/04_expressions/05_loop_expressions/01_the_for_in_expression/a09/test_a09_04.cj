/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a09_04

  @Level:         1

  @Assertion: 4.5.1(9) We can use pattern to match the elements of the iteration, and
              if the match is successful (if patternGuard exists, the condition of patternGuard must
              also be satisfied), then execute the loop body block, and then recall next() at the
              beginning to continue the loop, the loop terminates when next() returns None.
  @Description: Checks that we can use nested pattern to match elements of iteration.
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

enum E { Value(Byte) }

main() {
    var found: Byte = 0

    for ((Value(red),Value(green),Value(blue)) in
            [(Value(128),Value(0),Value(0)),
             (Value(0),Value(255),Value(0)),
             (Value(0),Value(0),Value(128))] where green > 0)  {
        found = green
    }

    Assert.equals(255, found)
}
