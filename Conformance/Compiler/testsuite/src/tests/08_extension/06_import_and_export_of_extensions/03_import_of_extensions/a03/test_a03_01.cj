/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_03_a03_01

  @Level:         1

  @Assertion:       8.6.3(3) In particular, since extensions do not support shadowing any member of the type being 
                    extended, an error will be reported when a redefinition of the imported extension occurs.

  @Description:     Check that if imported extensions do not produce shadowing - no error will be raised.

  @Mode:            run

  @Negative:        no

  @Structure:       complex-main

  @Dependencies:    aux_test_a03_01.cj

*/

package pkg3

import utils.assert.Assert

import pkg1.*

main() {
    var myClassImpl = MyClass()
    Assert.equals(1, myClassImpl.myFunc())

    var myStructImpl = MyStruct()
    Assert.equals(1, myStructImpl.myFunc())

    Assert.equals(1, MyEnum.J.myFunc())
}
