/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_02_a07_03

  @Level:         1

  @Assertion:    3.3.2.2(7) Note that the initialization order between files/packages doesn’t form a
                 total order. If there are no dependency between files/packages, or circular dependency
                 between files/packages, then the initialization order between the files/packages is
                 non-deterministic and depends on implementation.

  @Description:  File5 depends on File2 & File4
                 File4 depends on File1 & File3
                 File2 depends on File1 & File4
                 File1 depends on File3
                 Dependencies with static variables
                 Initialization order: File3, File1, File4, File2, File5

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a07_03_1.cj aux_test_a07_03_2.cj aux_test_a07_03_3.cj aux_test_a07_03_4.cj aux_test_a07_03_5.cj ../../init_order/init_common.cj

  @Issue:        0006065

*/

internal import init_order.InitCommon
import utils.assert.Assert

main() {
    v51F32 = 5.5
    Assert.equals("C1C2C3A1A2A3D1D2D3B1B2B3E1E2E3", InitCommon.getOrderString())
}
