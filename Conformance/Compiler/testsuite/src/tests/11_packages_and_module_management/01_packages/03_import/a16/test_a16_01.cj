/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a16_01

  @Level:         1

  @Assertion:    11.1.3(16) It is supported to use a fully qualified 
                 name like curPackageName.xxx to access the contents 
                 of the current package. 

  @Description:  Check that it's supported to use fully qualified name
                 like curPackageName.xxx to access the contents of the
                 current package.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a16_01.cj

*/

package p1

import utils.assert.Assert

main() {
    Assert.equals(2023, currentYear)
    return 0
}
