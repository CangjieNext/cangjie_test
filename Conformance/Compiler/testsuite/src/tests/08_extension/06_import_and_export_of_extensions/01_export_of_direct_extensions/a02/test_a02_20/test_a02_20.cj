/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_01_a02_20

  @Level:         1

  @Assertion:       8.6.1(2) When direct extensions are defined in the same `package` as the extended type, whether the extension is exported is determined by the lowest access level of the type used in the extended type and the generic constraints (if any).

  @Description:     Direct extensions are defined in the same `package` as the extended type
                    Generic, contains multiple generic constraints
                    Extended type modifier public
                    Access extension members in the same module packages of the extended type
                    There is a constraint type modified by public/protected
                    Generic constraint types are imported at all

  @Mode:            run

  @Negative:        no

  @Structure:       complex-main

  @Dependencies:    aux_test_a02_20.cj

*/

package a.c

import utils.assert.Assert
import a.b.*


main() {
    var myClassImpl = MyClass<Int64>()
    Assert.equals("MyClass myExtendFunc()", myClassImpl.myExtendFunc())
}
