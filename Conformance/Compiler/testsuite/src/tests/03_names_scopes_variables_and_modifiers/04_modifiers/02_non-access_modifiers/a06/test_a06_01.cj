/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a06_01

  @Level:         1

  @Assertion:    3.4.2(6) abstract means the class is an abstract class, See class for details

  @Description:  Check that an abstract class can be inherited.

  @Mode:         run

  @Negative:     no

  @Structure:    single
*/

import utils.assert.Assert

abstract class C1 {
    var currentYear = 2023

    protected func foo(p: String): String
}

class C2 <: C1 {
    protected func foo(p: String) {
        return "Hello ${p}"
    }
}

main() {
    var obj = C2()
    Assert.equals(2023, obj.currentYear)
    Assert.equals("Hello stranger", obj.foo("stranger"))
}
