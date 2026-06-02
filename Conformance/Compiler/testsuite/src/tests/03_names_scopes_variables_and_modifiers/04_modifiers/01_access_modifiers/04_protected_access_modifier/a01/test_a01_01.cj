/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         03_04_01_04_a01_01

  @Level:         1
  @Assertion:    3.4.1.4(1) The protected access modifier protected is an access
                 level between default and public. The members declared as protected
                 can be accessed not only inside the package, but also outside the
                 package for the current class subclasses.

  @Description:  Tests protected members can be accessed from sub-class

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: aux_test_a01.cj

*/

package pkg2

import pkg1.*
import utils.assert.Assert
import utils.macros.*

class B <: A {
    func f1(): Unit { 
        Assert.equals(0, i, reason: "Int value must match")
        Assert.equals("bla-bla-str", s, reason: "Str value must match")
        Assert.equals(true, p, reason: "Bool value must match")
        Assert.equals(.666, f, reason: "Float value must match")
        @matchOrThrow[E.F](funcE())
    }
}

main() {
    B().f1()
    return 0
}
