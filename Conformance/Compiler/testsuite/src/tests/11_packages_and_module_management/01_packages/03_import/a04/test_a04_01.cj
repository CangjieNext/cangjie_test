/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a04_01

  @Level:         1

  @Assertion:    11.1.3(4) When importing across modules, you must specify the module using from identifier.

  @Description:  Check that when few modules imported user must specify the module using `from` identifier

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a04_01.cj aux_test_a04_02.cj

*/

import package1.AuxTestA0401 as mod1 
import package2.AuxTestA0402 as mod2

import utils.assert.Assert

main() {
    Assert.equals("mod113a041", mod1.moduleName())
    Assert.equals("mod113a042", mod2.moduleName())
}
