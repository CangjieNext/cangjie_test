/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a53_01

  @Level:         1

  @Assertion: 4.28(53) Note: When ? is used together with ., (), {} or [], the evaluation order
              is not strictly according to
              their precedence and associativity described in the table, as it is a form of syntactic sugar. See the
              question mark operator for details.

  @Description: Check the '?' usage together with ., (), {} and []. It should violate precedence rules.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    var x: Int64 = 5

    operator func[](index: Int64) {
        return 6
    }

    operator func()(arg: Int64) {
        return 7
    }

    operator func()(fn: () -> Int64) {
        return 8
    }
}

main() {
    var c: ?C = C()

    var x1 = c?.x
    // NOTE: "(c?).x" expression is prohibited. There is no honest way to check the precedence.
    // NOTE: correspondence to precedence rules "c?(.x)" would cause a compilation error. Checked separately.
    Assert.isTrue(x1 is Option<Int64>)
    Assert.isTrue(x1 == 5)

    var x2 = c?[1]
    // NOTE: "(c?)[1]" expression is prohibited. There is no honest way to check the precedence.
    // NOTE: correspondence to precedence rules "c?([1])" would mean a call, not an index access. Can not be checked.
    Assert.isTrue(x2 is Option<Int64>)
    Assert.isTrue(x2 == 6)

    var x3 = c?(1)
    // NOTE: "(c?)(1)" expression is prohibited. There is no honest way to check the precedence.
    // NOTE: correspondence to precedence rules "c?((1))" would be the same to "c?(1)". Can not be checked.
    Assert.isTrue(x3 is Option<Int64>)
    Assert.isTrue(x3 == 7)

    var x4 = c?{ => 1709 }
    // NOTE: "(c?){ => 1709 }" expression is prohibited. There is no honest way to check the precedence.
    // NOTE: correspondence to precedence rules "c?({ => 1709 })" would be the same to "c?{ => 1709 }". Can not be
    //       checked.
    Assert.isTrue(x4 is Option<Int64>)
    Assert.isTrue(x4 == 8)

    return
}

