/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a08_01

  @Level:         1

  @Assertion:    3.4.2(8) mut indicates that the member is of mutable semantics, See function for details

  @Description:  Check that mut can be applied to functions in structs and interfaces.

  @Mode:         run

  @Negative:     no

  @Structure:    single
*/

import utils.assert.Assert

struct S1 {
    var a = 1

    mut func double() {
        this.a *= 2
    }
}

interface I {
    mut func setDate(): Unit
}

struct S2 <: I {
    var currentYear = 0

    public mut func setDate() {
        currentYear = 2023
    }
}

main() {
    var obj1 = S1()
    var obj2 = S2()

    Assert.equals(1, obj1.a)
    Assert.equals(0, obj2.currentYear)

    obj1.double()
    obj2.setDate()

    Assert.equals(2, obj1.a)
    Assert.equals(2023, obj2.currentYear)
}
