/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_05_a06_01

  @Level:         1

  @Assertion:    11.1.3.5(6) Similarly, if definitions or declarations with the same name 
                 of different packages with the same name are imported from different modules,
                 no error will be reported at the import declaration without renaming, but it 
                 can only be accessed by moduleName.packageName.declName.

  @Description:  Check that different packages with the same name can be imported from different 
                 modules, but they can be only accessed by moduleName.packageName.declName

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a06_01.cj aux_test_a06_02.cj

  @Module:       mod3

 */

import p1
import p2

import utils.assert.Assert

main() {
    Assert.equals("mod1", p1.moduleName())
    Assert.equals("mod2", p2.moduleName())
}
