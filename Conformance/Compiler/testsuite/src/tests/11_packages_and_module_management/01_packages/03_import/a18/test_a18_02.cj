/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a04_02

  @Level:         1

  @Assertion:    11.1.3(4) When importing across modules, you must specify the module using from identifier.

  @Description:  Check that when few modules imported user must specify the module using `from` identifier

  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a18_01.cj aux_test_a18_02.cj

*/

import package1.AuxTestA1801 as mod1 
import package2.AuxTestA1802 as mod2

main() {
    mod1.moduleName()
    mod2.moduleName()
    return 0
}
