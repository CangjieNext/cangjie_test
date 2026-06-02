/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a09_01

  @Level:         1

  @Assertion: 4.5.1(9) We can use pattern to match the elements of the iteration, and
              if the match is successful (if patternGuard exists, the condition of patternGuard must
              also be satisfied), then execute the loop body block, and then recall next() at the
              beginning to continue the loop, the loop terminates when next() returns None.
  @Description: Checks that next() is called on each iteration and
              that loop terminates when next() returns None
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

var numNextCalls = 0

class Iter <: Iterator<Int64> {
    var start: Int64
    let end: Int64
    init(start: Int64, end: Int64) {
        if (start > end) {
            throw Exception("Iter: start=${start} can not be greater than end=${end}")
        }
        this.start = start
        this.end = end
    }
    public func next(): Option<Int64> {
        numNextCalls++
        if (start <= end) {
            start++
            start-1
        } else {
            None
        }
    }
}

main() {
    for (_ in Iter(1,3)) {
    }

    Assert.equals(4, numNextCalls)
}
