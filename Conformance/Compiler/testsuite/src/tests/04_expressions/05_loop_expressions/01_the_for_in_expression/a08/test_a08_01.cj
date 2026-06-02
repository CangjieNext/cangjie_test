/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a08_01

  @Level:         1

  @Assertion: 4.5.1(8) The program starts the loop by calling the next() function of Iterator<T>.
  @Description: Checks that next() is called on iterator before loop body executes
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
    var count = 0

    for (_ in Iter(1,3)) {
        Assert.isTrue(numNextCalls > 0)
        count++
    }

    Assert.equals(3, count)
}
