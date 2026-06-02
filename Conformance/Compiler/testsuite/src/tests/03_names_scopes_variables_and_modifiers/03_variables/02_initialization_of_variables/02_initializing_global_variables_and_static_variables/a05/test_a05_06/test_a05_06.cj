/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_02_a05_06

  @Level:         1

  @Assertion:    3.3.2.2(5) For variables declared in different files of the same package, or in different packages,
                 the initialization is done following the dependence relation between files (or packages)

  @Description:  Check initialization order for global variables declared in different packages. Dependency 2>1>3.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: test3/aux_test_a05_06_3.cj test1/aux_test_a05_06_1.cj test2/aux_test_a05_06_2.cj ../../init_order/init_common.cj

  @Issue:        0006065

*/

package test_a05_06

import test3.*
import init_order.InitCommon
import utils.assert.Assert

main() {
    v3F32 = 0.5
    Assert.isTrue(InitCommon.getOrderString() == "BAC")
}
