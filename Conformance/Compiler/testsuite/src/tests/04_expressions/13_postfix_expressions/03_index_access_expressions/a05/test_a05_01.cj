/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_03_a05_01

  @Level:         1

  @Assertion: 4.13.3(5) For the index expression e1[e2], Cangjie will always evaluate e1 to v1 first
              and then e2 to v2, and finally pick the corresponding value according to the index v2
              or call the corresponding operator [] that is overloaded.

  @Description: Check that 'e1' is evaluated before 'e2' in 'e1[e2]' expression.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class Counter {
    init() {
        x = 0
    }

    func next() {
        x++
        return x - 1
    }

    var x: Int64
}

main() {
    let a = [[1, 2, 3],
             [4, 5, 6],
             [7, 8, 9]]
    var c = Counter()

    // Evaluation order matters due to specific of 'c.next' call.
    //
    // 1. 'a[c.next()]' should be evaluated first to a[0]
    // 2. 'c.next()' should be evaluated second to 1
    // 3. Result should be a[0][1] == 2

    let x = a[c.next()][c.next()]
    Assert.equals(2, x)
}

