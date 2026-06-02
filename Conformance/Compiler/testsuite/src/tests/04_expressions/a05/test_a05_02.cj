
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_a05_02

  @Level:         1

  @Assertion:   4(5) If a expression contains multiple operators, it is 
                necessary to specify the precedence, associativity and
                evaluation order of the operators.
                Note that different precedence, associativity or evaluation order
                may result in different evaluation values of the expression.
  @Description: Checks that operators can have different assotiativity and this 
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

var sum = 0

class LeftDot {
    var x = 0

    init (val: Int64) {
        x = val
    }

    // '*' operator is left-associated
    operator func *(dot: LeftDot): LeftDot {
        sum += dot.x + 1        
        LeftDot(x * sum)
    }
}

class RightDot {
    var x = 0

    init (val: Int64) {
        x = val
    }

    // '**' operator is right-associated
    operator func **(dot: RightDot): RightDot {
        sum += dot.x + 1
        RightDot(x * sum)
    }
}

main() {
    var dot1 = LeftDot(1) * LeftDot(2)
    Assert.equals(3, dot1.x)

    var dot2 = RightDot(1) ** RightDot(2) 
    Assert.equals(6, dot2.x)

    // Would be equal if '*' and '**' operators had the same assotiativity.
    Assert.notEquals(dot1.x, dot2.x)

    dot1 = LeftDot(i1) * LeftDot(i2)
    Assert.equals(20, dot1.x)

    dot2 = RightDot(i1) ** RightDot(i2) 
    Assert.equals(28, dot2.x)

    // Would be equal if '*' and '**' operators had the same assotiativity.
    Assert.notEquals(dot1.x, dot2.x)
}
