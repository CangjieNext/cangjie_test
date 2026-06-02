/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_02_a01_02

  @Level:         1

  @Assertion:       8.6.2(1) When the interface extension and the extended type are in the same `package`, the extension is exported together with the extended type and is not affected by the access level of the interface type. The members of the extension can be accessed outside the package without importing the interface type.

  @Description:     Direct extensions are defined in the same `package` as the extended type
                    Generic,contains multiple generic constraints
                    Extended type modifier internal
                    Access extension members in different module packages of the extended type
                    All constraint types are modified by public/protected
                    Generic constraint types are imported at all
                    Extension implements five interface,multiple interfaces have different modifiers
                    Interfaces are imported at all

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       complex-main

  @Dependencies:    aux_test_a01_02.cj

*/

package d

import utils.assert.Assert
import a.b.*

main() {
    var myClassImpl = MyClass<Int64>()
    Assert.equals(1, myClassImpl.test1())
    Assert.equals(2, myClassImpl.test2())
    Assert.equals(3, myClassImpl.test3())
    Assert.equals(4, myClassImpl.test4())
    Assert.equals(5, myClassImpl.test5())
    Assert.equals("MyClass myExtendFunc()", myClassImpl.myExtendFunc())
}
