/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_02_a02_12

  @Level:         1

  @Assertion:       8.6.2(2) When an interface extension is in a different `package` from the type being extended, whether the interface extension is exported is determined by the smallest access level of the type used in the interface type and the generic constraints (if any). Other `packages` must import the extended type, the corresponding interface, and the type used by the constraint (if any) to access the extended members contained in the corresponding interface.

  @Description:     Direct extensions are defined in different `package` as the extended type
                    Generic,contains multiple generic constraints
                    Extended type modifier public
                    Extend in subpackage of interface definition
                    Access extension members in a subpackage of the extended type
                    All constraint types are modified by private
                    Generic constraint type partial import
                    Extension implements five interface, multiple interfaces have different modifiers
                    Import the interface part

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       complex-main

  @Dependencies:    aux_extend_test_a02_12.cj aux_test_a02_12.cj

*/

package a.c.d

import utils.assert.Assert
import a.c.{AuxTestA0212,I1,I2,I3,I5,I11,I12}


main() {
    var myClassImpl = AuxTestA0212<Int64>()
    Assert.equals(1, myClassImpl.test1())
    Assert.equals(2, myClassImpl.test2())
    Assert.equals(3, myClassImpl.test3())
    Assert.equals(4, myClassImpl.test4())
    Assert.equals(5, myClassImpl.test5())
    
}
