
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a06_01

  @Level:         1

  @Assertion:   16.1(6) const variables can be defined and used like let/var declared variables. 
  @Description: Checks scenarios of definition and usage of const variables which are valid for let/var declared
                variables as well.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a06.cj
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert
import p.*

const c0 = 0
const c1: Int64 = 1

class D <: AuxA06 {
    private static const c13 = 13
    private static const c14: Int64 = 14
    private static const c15 = 15
    private static const c16: Int64 = 16

    const init() { }

    func check() {
        Assert.equals(11, AuxA06.c11)
        Assert.equals(12, AuxA06.c12)
        Assert.equals(13, D.c13)
        Assert.equals(14, D.c14)
        Assert.equals(15, D.c15)
        Assert.equals(16, D.c16)
        Assert.equals(19, AuxA06.c19)
        Assert.equals(20, AuxA06.c20)
    }
}

main() {
    const c2 = 2
    const c3: Int64 = 3
    Assert.equals(0, c0)
    Assert.equals(1, c1)
    Assert.equals(2, c2)
    Assert.equals(3, c3)
    Assert.equals(4, c4)
    Assert.equals(21, c21)
    Assert.equals(17, AuxA06.c17)
    Assert.equals(18, AuxA06.c18)
    var c = AuxA06()
    Assert.equals(9, AuxA06.c9)
    Assert.equals(10, AuxA06.c10)
    check()
    D().check()
}
