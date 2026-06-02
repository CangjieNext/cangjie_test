/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a09_01

  @Level:         1

  @Assertion: 4.13.4(9) Using the expressions a?.b, c?(d) and e?[f] as examples.

              1. The type of expression a needs to be some Option<T1> and T1 contains an instance member b. The type
                 of expression c needs to be some Option<(T2)->U2> and d is of type T2. The type of expression e needs
                 to be some Option<T3> and T3 supports subscript operator.

  @Description: Check correct usages of 'a?.b', 'c?(d)' and 'e?[f]' patterns.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

struct S {
    var x = 6
}

main() {
    let s: ?S = S()
    let a: ?Array<Int64> = [1, 2, 3, 4, 5]
    let f: ?((Int64) -> Int64) = { x => x }

    // Case: a?.b
    let x1 = s?.x
    Assert.equals(6, x1.getOrThrow())

    // Case: c?(d)
    let x2 = f?(5)
    Assert.equals(5, x2.getOrThrow())

    // Case: e?[f]
    let x3 = a?[1]
    Assert.equals(2, x3.getOrThrow())
}

