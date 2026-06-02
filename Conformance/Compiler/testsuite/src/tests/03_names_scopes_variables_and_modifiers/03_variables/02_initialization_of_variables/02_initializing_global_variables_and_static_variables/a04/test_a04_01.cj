/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_02_a04_01

  @Level:         1

  @Assertion:    3.3.2.2(4) For variables declared in the same file, the initialization executes from the top to the
                 bottom

  @Description:  Check initialization order for global variables.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../init_order/init_common.cj

*/

import init_order.InitCommon
import utils.assert.Assert

var vInt32: Int32 = InitCommon.initInt32("A")
var vF32: Float32 = InitCommon.initFloat32("B")
let vStr  = InitCommon.initStr("C")
let vBool = InitCommon.initBool("D")

main() {
    Assert.isTrue(InitCommon.getOrderString() == "ABCD")
}
