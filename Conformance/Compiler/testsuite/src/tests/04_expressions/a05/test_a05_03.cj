
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_a05_03

  @Level:         1

  @Assertion:   4(5) If a expression contains multiple operators, it is 
                necessary to specify the precedence, associativity and
                evaluation order of the operators.
                Note that different precedence, associativity or evaluation order
                may result in different evaluation values of the expression.
  @Description: Checks that it is possible to set the expression evaluation 
                order using parenthesis, and so different evaluation order may
                result in different evaluation values of the expression.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

let i1: Int64 = Assert.getRuntimeZero()
let i2: Int64 = 2
let i3: Int64 = 3
let i4: Int64 = 4
var i5: Int64 = Assert.getRuntimeZero() + 10
var i6: Int64 = 20
var i7: Int64 = 30

main() {
    var x1 = i1 - 5 + i2 - 6 / i3 * 7 + i4 - 8 * i5 % 9 % i6 * 10 + i7
    Assert.equals(-63, x1)

    var x2 = (i1 - 5) + (i2 - 6) / (i3 * 7) + (i4 - 8) * i5 % (9 % i6) * (10 + i7)
    Assert.equals(-165, x2)

    var x3 = (i1 - 5 + i2) - (6 / i3 * 7) + (i4 - 8 * i5) % (9 % i6 * 10) + i7
    Assert.equals(-63, x3)

    var x4 = (i1 - 5 + i2 - 6) / (i3 * 7 + i4 - 8) * (i5 % 9 % i6 * 10) + i7
    Assert.equals(30, x4)

    var x5 = (i1 - 5 + i2 - 6 / i3) * (7 + i4 - 8 * i5 % 9) % (i6 * 10 + i7)
    Assert.equals(-15, x5)

    var x6 = (i1 - 5 + i2 - 6 / i3 * 7 + i4) - (8 * i5 % 9 % i6 * 10 + i7)
    Assert.equals(-123, x6)

    var x7 = (i1 - 5 + i2 - 6 / i3 * 7 + i4 - 8) * (i5 % 9 % i6 * 10 + i7)
    Assert.equals(-840, x7)

    Assert.notEquals(x1, x2)
    Assert.equals(x1, x3)
    Assert.notEquals(x1, x4)
    Assert.notEquals(x1, x5)
    Assert.notEquals(x1, x6)
    Assert.notEquals(x1, x7)
}
