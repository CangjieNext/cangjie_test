
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        10_02_03_a01_01

  @Level:         1

  @Assertion:   10.2.3(1) The following table lists all the operators that can be overloaded (the closer an operator
                is to the top of the table, the higher precedence it has):
                Operator    Description
                ()          Function call
                []          indexing
                !-          NOT: unary Negative: unary
                **          Power: binary
                /%*         Divide: binary Remainder: binary Multiply: binary
                +-          Add: binary Subtract: binary
                << >>       Bitwise left shift: binary Bitwise right shift: binary
                < <= > >=   Less than: binary Less than or equal: binary
                            Greater than: binary Greater than or equal: binary
                == !=       Equal: binary Not equal: binary
                &           Bitwise AND: binary
                ^           Bitwise XOR: binary
                |           Bitwise OR: binary
  @Description: Checks that the given operators can be overloaded. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert

class C {
    let s : String

    C(str : String) { s = str }

    operator func ()() { C("${s}()") }

    operator func ()(other : C) { C("${s}(${other.s})") }

    operator func ()(arg0 : C, arg1 : C) { C("${s}(${arg0.s}, ${arg1.s})") }

    operator func [](other : C) { C("${s}[${other.s}]") }

    operator func !() { C("!${s}") }

    operator func -() { C("-${s}") }

    operator func **(other : C) { C("${s}**${other.s}") }

    operator func *(other : C) { C("${s}*${other.s}") }

    operator func /(other : C) { C("${s}/${other.s}") }

    operator func %(other : C) { C("${s}%${other.s}") }

    operator func +(other : C) { C("${s}+${other.s}") }

    operator func -(other : C) { C("${s}-${other.s}") }

    operator func <<(other : C) { C("${s}<<${other.s}") }

    operator func >>(other : C) { C("${s}>>${other.s}") }

    operator func <(other : C) { C("${s}<${other.s}") }

    operator func <=(other : C) { C("${s}<=${other.s}") }

    operator func >(other : C) { C("${s}>${other.s}") }

    operator func >=(other : C) { C("${s}>=${other.s}") }

    operator func ==(other : C) { C("${s}==${other.s}") }

    operator func !=(other : C) { C("${s}!=${other.s}") }

    operator func &(other : C) { C("${s}&${other.s}") }

    operator func ^(other : C) { C("${s}^${other.s}") }

    operator func |(other : C) { C("${s}|${other.s}") }
}

main() {
    let c1 = C("C1")
    let c2 = C("C2")
    Assert.equals("C1()", c1().s)
    Assert.equals("C1(C2)", c1(c2).s)
    Assert.equals("C1(C1, C2)", c1(c1, c2).s)
    Assert.equals("C1[C2]", c1[c2].s)
    Assert.equals("!C1", (!c1).s)
    Assert.equals("-C1", (-c1).s)
    Assert.equals("C1*C2", (c1*c2).s)
    Assert.equals("C1**C2", (c1**c2).s)
    Assert.equals("C1/C2", (c1/c2).s)
    Assert.equals("C1%C2", (c1%c2).s)
    Assert.equals("C1+C2", (c1+c2).s)
    Assert.equals("C1-C2", (c1-c2).s)
    Assert.equals("C1<<C2", (c1<<c2).s)
    Assert.equals("C1>>C2", (c1>>c2).s)
    Assert.equals("C1<C2", (c1<c2).s)
    Assert.equals("C1<=C2", (c1<=c2).s)
    Assert.equals("C1>C2", (c1>c2).s)
    Assert.equals("C1>=C2", (c1>=c2).s)
    Assert.equals("C1==C2", (c1==c2).s)
    Assert.equals("C1!=C2", (c1!=c2).s)
    Assert.equals("C1&C2", (c1&c2).s)
    Assert.equals("C1^C2", (c1^c2).s)
    Assert.equals("C1|C2", (c1|c2).s)
}
