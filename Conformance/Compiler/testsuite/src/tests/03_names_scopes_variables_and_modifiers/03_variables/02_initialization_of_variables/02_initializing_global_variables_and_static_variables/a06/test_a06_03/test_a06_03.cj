/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_02_a06_03

  @Level:         1

  @Assertion:    3.3.2.2(6) The initialization order (together with our rules for initialization below)
                 ensures that, if the initialization of a variable in File A (or Package A) relies on
                 declarations (variables, functions, type constructors, etc.) in other files or packages,
                 then the initialization of global variables in these files or packages are executed
                 before the initializations in File A (Package A);

  @Description:  test1 depends on test4 & test3
                 test2 depends on test4
                 test3 depends on test4, test2
                 Dependencies with variables
                 Initialization order: test4, test2, test3, test1

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: test1/aux_test_a06_03_1.cj test3/aux_test_a06_03_3.cj test2/aux_test_a06_03_2.cj test4/aux_test_a06_03_4.cj ../../init_order/init_common.cj

  @Issue:        0006065

*/

package test_a06_03

import init_order.InitCommon
import utils.assert.Assert
import test1.*

main() {
    v1F32 = 5.5
    Assert.isTrue(InitCommon.getOrderString() == "DBCA")
}
