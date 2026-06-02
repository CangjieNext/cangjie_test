/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_02_a06_01

  @Level:         1

  @Assertion:    3.3.2.2(6) The initialization order (together with our rules for initialization below)
                 ensures that, if the initialization of a variable in File A (or Package A) relies on
                 declarations (variables, functions, type constructors, etc.) in other files or packages,
                 then the initialization of global variables in these files or packages are executed
                 before the initializations in File A (Package A);

  @Description:  File1 depends on File4 & File3
                 File2 depends on File4
                 File3 depends on File4, File2
                 Dependencies with variables & functions
                 Initialization order: File4, File2, File3, File1

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a06_01_1.cj aux_test_a06_01_2.cj aux_test_a06_01_3.cj aux_test_a06_01_4.cj ../../init_order/init_common.cj

  @Issue:        0006065

*/

internal import init_order.InitCommon
import utils.assert.Assert

main() {
    Assert.isTrue(InitCommon.getOrderString() == "DBCA")
}
