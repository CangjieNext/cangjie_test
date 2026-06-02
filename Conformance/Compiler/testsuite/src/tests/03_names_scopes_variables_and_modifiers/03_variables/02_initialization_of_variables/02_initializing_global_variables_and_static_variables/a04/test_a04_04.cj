/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_02_a04_04

  @Level:         1

  @Assertion:    3.3.2.2(4) For variables declared in the same file, the initialization executes from the top to the
                 bottom

  @Description:  Check initialization order for mixed declarations of global/class static/struct static variables.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../init_order/init_common.cj

*/

import init_order.InitCommon
import utils.assert.Assert

let sInt = InitCommon.initInt32("A")

class Test1 {
    static var sTuple = InitCommon.initTuple("B")
}

var sBool = InitCommon.initBool("C")

struct Test2 {
    static let sRange = InitCommon.initRange("D")
}

main() {
    Assert.isTrue(InitCommon.getOrderString() == "ABCD")
}
