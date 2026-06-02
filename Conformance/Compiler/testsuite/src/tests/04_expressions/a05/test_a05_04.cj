
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_a05_04

  @Level:         1

  @Assertion:   4(5) If a expression contains multiple operators, it is 
                necessary to specify the precedence, associativity and
                evaluation order of the operators.
                Note that different precedence, associativity or evaluation order
                may result in different evaluation values of the expression.
  @Description: Checks that expression evaluation order can affect evaluation 
                values of the expression.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var cnt = 0

func f1(): Int64 {
    cnt++
    cnt 
}

func f2(): Int64 {
    cnt += 2
    cnt
}

main() {
    cnt = 0
    var x1 = f1() * f2()
    Assert.equals(3, x1)

    cnt = 0
    var x2 = f2() * f1()
    Assert.equals(6, x2)

    Assert.notEquals(x1, x2)
}
