
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_a05_01

  @Level:         1

  @Assertion:   4(5) If a expression contains multiple operators, it is 
                necessary to specify the precedence, associativity and
                evaluation order of the operators.
                Note that different precedence, associativity or evaluation order
                may result in different evaluation values of the expression.
  @Description: Checks that operators can have different precedence and this 
                can affect the expression evaluation value.
  @Comments:    By the Spec, operators that are overloaded do not change their 
                precedence and associativity.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

let i1 = Assert.getRuntimeZero() + 2
let i2 = Assert.getRuntimeZero() + 3
let i3 = Assert.getRuntimeZero() + 4

class Dot1 {
    var x = 0

    init (val: Int64) {
        x = val
    }

    operator func +(dot: Dot1): Dot1 {
        Dot1(x + dot.x)
    }

    operator func *(dot: Dot1): Dot1 {
        Dot1(x * dot.x)
    }
}

class Dot2 {
    var x = 0

    init (val: Int64) {
        x = val
    }

    operator func +(dot: Dot2): Dot2 {
        Dot2(x * dot.x)
    }

    operator func *(dot: Dot2): Dot2 {
        Dot2(x + dot.x)
    }
}

main() {
    var dot1 = Dot1(1) + Dot1(2) * Dot1(3)
    Assert.equals(7, dot1.x)

    var dot2 = Dot2(1) * Dot2(2) + Dot2(3)
    Assert.equals(9, dot2.x)

    // Would be equal if '+' and '*' operators had equal precedence.
    Assert.notEquals(dot1.x, dot2.x)

    dot1 = Dot1(i1) + Dot1(i2) * Dot1(i3)
    Assert.equals(14, dot1.x)

    dot2 = Dot2(i1) * Dot2(i2) + Dot2(i3)
    Assert.equals(20, dot2.x)

    // Would be equal if '+' and '*' operators had equal precedence.
    Assert.notEquals(dot1.x, dot2.x)
}
