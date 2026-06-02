/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_02_a07_04

  @Level:         1

  @Assertion:    3.3.2.2(7) Note that the initialization order between files/packages doesn’t form a
                 total order. If there are no dependency between files/packages, or circular dependency
                 between files/packages, then the initialization order between the files/packages is
                 non-deterministic and depends on implementation.

  @Description:  Test5 depends on Test2 & Test4
                 Test4 depends on Test1 & Test3
                 Test2 depends on Test1 & Test4
                 Test1 depends on Test3
                 Dependencies with variables
                 Initialization order: Test3, Test1, Test4, Test2, Test5

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: test5/aux_test_a07_04_5.cj test2/aux_test_a07_04_2.cj test4/aux_test_a07_04_4.cj test1/aux_test_a07_04_1.cj test3/aux_test_a07_04_3.cj ../../init_order/init_common.cj

  @Issue:        0006065

*/

package test_a07_04

import init_order.InitCommon
import utils.assert.Assert
import test5.*

main() {
    v51F32 = 5.5
    Assert.equals("C1C2C3A1A2A3D1D2D3B1B2B3E1E2E3", InitCommon.getOrderString())
}
