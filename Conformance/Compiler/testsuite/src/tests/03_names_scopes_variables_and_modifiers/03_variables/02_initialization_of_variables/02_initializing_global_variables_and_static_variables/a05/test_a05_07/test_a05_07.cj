/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_02_a05_07

  @Level:         1

  @Assertion:    3.3.2.2(5) For variables declared in different files of the same package, or in different packages,
                 the initialization is done following the dependence relation between files (or packages)

  @Description:  Check initialization order for global/static variables declared in different packages.
                 Dependency 3>2>1.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: test1/aux_test_a05_07_1.cj test2/aux_test_a05_07_2.cj test3/aux_test_a05_07_3.cj ../../init_order/init_common.cj

  @Issue:        0006065

*/

package test_a05_07

import test1.*
import init_order.InitCommon
import utils.assert.Assert

main() {
    vF32 = 0.5
    Assert.isTrue(InitCommon.getOrderString() == "CBA")
}

