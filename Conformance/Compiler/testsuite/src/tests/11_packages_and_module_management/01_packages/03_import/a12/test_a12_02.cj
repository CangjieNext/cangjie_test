/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a12_02

  @Level:         1

  @Assertion:    11.1.3(12) In the case of import packageName.*, top-level declarations 
                 declared with modifier public in the package packageName are imported, 
                 which can be accessed through the syntax packageName.xxx or simply xxx. 

  @Description:  Check that in the case of import packageName.*, top-level declarations
                 declared with modifier public in the packageName are imported

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a12_01.cj

*/

import p1.*

import utils.assert.Assert

main() {
    Assert.equals("p1", packageName())
    Assert.equals(2023, currentYear)
    return 0
}
