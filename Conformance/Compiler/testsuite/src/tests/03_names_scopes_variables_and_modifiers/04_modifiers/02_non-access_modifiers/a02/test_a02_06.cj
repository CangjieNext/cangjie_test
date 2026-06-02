/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a02_06

  @Level:         1

  @Assertion:    3.4.2(2) open indicates that the instance member can be overridden by a subclass,
                 or that the class can be inherited by a subclass, See class for details

  @Description:  Check that public open class can be inherited in another package and its functions can be accessed
                 from the subclass.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a02_06.cj
*/

package test06

import utils.assert.Assert
import aux_test_a02_06.*

class C2 <: C1 {

}

main() {
    var obj = C2()
    Assert.equals("interface foo", obj.f0())
    Assert.equals("foo", obj.f1())
    Assert.equals("static foo", C2.f2())
}
