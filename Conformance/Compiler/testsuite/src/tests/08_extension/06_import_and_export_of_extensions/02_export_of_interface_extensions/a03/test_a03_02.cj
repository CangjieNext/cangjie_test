/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_02_a03_02

  @Level:         1

  @Assertion:       8.6.2(3) As shown in the following example, the members exported by an interface extension are limited to those contained in the interface.

  @Description:     The members exported by an interface extension are limited to those contained in the interface

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       complex-main

  @Dependencies:    aux_extend_test_a03_01.cj aux_test_a03_01.cj

*/

package c

import utils.assert.Assert
import b.*


main() {
    var myClassImpl = AuxTestA0301()
    Assert.equals(3, myClassImpl.test3())
    Assert.equals("MyClass myExtendFunc()", myClassImpl.myExtendFunc())  
}
