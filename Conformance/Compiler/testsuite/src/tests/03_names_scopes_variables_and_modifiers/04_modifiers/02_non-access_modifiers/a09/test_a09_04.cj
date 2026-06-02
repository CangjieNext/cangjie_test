/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a09_04

  @Level:         1

  @Assertion:    3.4.2(9) operator indicates that the function is an operator overload function, See Operator
                 Overloading for details

  @Description:  Check that struct can contain operator functions, which can be used from another package.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a09_04.cj
*/

package test04

import utils.assert.Assert
import aux_test_a09_04.*

main() {
    var obj1 = AuxTestA0904(100)

    Assert.equals(100, obj1.localp)
    Assert.equals(110, obj1.foreignp)

    var obj2 = obj1 + 50

    Assert.equals(150, obj2.localp)
    Assert.equals(160, obj2.foreignp)
}
