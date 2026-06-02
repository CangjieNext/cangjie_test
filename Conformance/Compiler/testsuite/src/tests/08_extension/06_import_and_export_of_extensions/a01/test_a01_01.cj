/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_a01_01

  @Level:         1

  @Assertion:       8.6(1) The extension itself cannot be modified with public, and the extension can only be 
                    imported and exported together with the type being extended or interface.

  @Description:     Check that type extensions can be exported or imported together with the type being extended

  @Mode:            run

  @Negative:        no

  @Structure:       complex-main

  @Dependencies:    aux_test_a01_01.cj

*/

package pkg2

import utils.assert.Assert

import pkg1.AuxTestA0101

main() { 
    var myClassImpl = AuxTestA0101(111)
    Assert.equals(111, myClassImpl.myVar)
    Assert.equals(111, myClassImpl.myFunc())
    myClassImpl.myFunc(22)
    Assert.equals(22, myClassImpl.myVar)
    Assert.equals(22, myClassImpl.myFunc())
} 
