/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_04_a01_01

  @Level:         1

  @Assertion: 4.5.4(1) The expressiveness of the for-in expression, the while expression and the
              do-while expression are the same.
  @Description: Test implementation of same functionality in all kinds of loops
  @Mode: run
  @Negative: no
  @CompileWarning: ignore

*/

import utils.assert.Assert

type Predicate = (Int64) -> Bool

func test_numbers_in_range_using_for (a: Int64, b: Int64, f: Predicate) {
    var count = 0
    for (i in a..=b) {
        if (f(i)) {
            count++
        }
    }
    return count
}

func test_numbers_in_range_using_while (a: Int64, b: Int64, f: Predicate) {
    var count = 0
    var i = a
    while (i <= b) {
        if (f(i)) {
            count++
        }
        i++
    }
    return count
}

func test_numbers_in_range_using_do_while (a: Int64, b: Int64, f: Predicate) {
    var count = 0
    var i = a
    do {
        if (f(i)) {
            count++
        }
        i++
    } while (i <= b)
    return count
}

main() {
    let predicate = { x: Int64 => x % 3 == 0 && x % 7 == 0 }

    Assert.equals(4, test_numbers_in_range_using_for (1, 100, predicate))
    Assert.equals(4, test_numbers_in_range_using_while (1, 100, predicate))
    Assert.equals(4, test_numbers_in_range_using_do_while (1, 100, predicate))
}
