/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a08_02

  @Level:         1

  @Assertion:    3.4.2(8) mut indicates that the member is of mutable semantics, See function for details

  @Description:  Check that mut can be applied to functions in structs and interfaces, and these function can be used
                 outside the package they were defined in.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a08_02.cj
*/

package test02

import utils.assert.Assert
import aux_test_a08_02.*

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
