/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a07_01

  @Level:         1

  @Assertion: 4.5.1(7) With for-in syntax, Cangjie evaluates the expression first and then calls the
              iterator() function on the evaluated value to get a value of type Iterator<T>.
  @Description: Checks that expression is evaluated once and that iterator() is called once on it
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

var numCtorCalls = 0
var numIteratorCalls = 0

class myIterator <: Iterator<Int64> {
    var start: Int64
    init(start: Int64, end: Int64) {
        if (start > end) {
            throw Exception("Iter: start=${start} can not be greater than end=${end}")
        }
        this.start = start
        this.end = end

    }
    let end: Int64
    public func next(): Option<Int64> {
        if (start <= end) {
            start++
            start-1
        } else {
            None
        }
    }
}

class Iter <: Iterable<Int64> {
    var iter : myIterator
    init(start: Int64, end: Int64) {
        numCtorCalls++
        iter = myIterator(start, end)
    }
    public func iterator(): Iterator<Int64> {
        numIteratorCalls++
        this.iter
    }
}

main() {
    var count = 0

    for (_ in Iter(1,3)) {
        count++
    }

    Assert.equals(1, numCtorCalls)
    Assert.equals(1, numIteratorCalls)
    Assert.equals(3, count)
}
