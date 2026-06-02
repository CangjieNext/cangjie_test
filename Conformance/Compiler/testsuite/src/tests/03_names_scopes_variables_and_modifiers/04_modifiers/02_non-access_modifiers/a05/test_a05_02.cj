/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a05_02

  @Level:         1

  @Assertion:    3.4.2(5) static means that the member is a static member, and static members cannot be accessed
                 through instance objects, See class for details

  @Description:  Check that static members can be accessed from another package using the type name without
                 instantiation.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a05_02.cj

  @Issue:        6124
*/

package test02

import utils.assert.Assert
import aux_test_a05_02.*

main() {
    Assert.equals(2.71, S.E)
    Assert.equals("foo1", C1.foo1())
    Assert.equals("foo2", C1.foo2())
    Assert.equals("foo3", C1.foo3())
    Assert.equals(2023, C1.currentYear)
    Assert.equals(3.14, C1.PI)
    Assert.equals(100, C1.b)
}
