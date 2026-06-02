/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_02_a02_03

  @Level:         1

  @Assertion:       8.6.2(2) When an interface extension is in a different `package` from the type being extended, whether the interface extension is exported is determined by the smallest access level of the type used in the interface type and the generic constraints (if any). Other `packages` must import the extended type, the corresponding interface, and the type used by the constraint (if any) to access the extended members contained in the corresponding interface.

  @Description:     Direct extensions are defined in different `package` as the extended type
                    Generic,contains multiple generic constraints
                    Extended type modifier internal
                    Extend in subpackage of interface definition
                    Access extension members in a subpackage of the extended type
                    All constraint types are modified by public/protected
                    Generic constraint types are imported at all
                    Extension implements one interface, interface modifier internal
                    Interfaces are imported at all

  @Mode:            run

  @Negative:        no

  @Structure:       complex-main

  @Dependencies:    aux_extend_test_a02_03.cj aux_test_a02_03.cj

*/

package a.b.c.d

import utils.assert.Assert
import a.b.c.*


main() {
    var myClassImpl = MyClass<Int64>()
    Assert.equals(1, myClassImpl.test1())
}
