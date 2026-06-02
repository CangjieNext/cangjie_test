/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_03_a06_01

  @Level:         1

  @Assertion:    13.1.2.3(6) The pointer passed to the C side by the Cangjie
                 side pass-by-reference expression is valid only for this
                 function call, that is, the C side should not save the pointer
                 for later use in this scenario.

  @Description:  CFunc is obtained from CPointer<void>.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006353

  @Comment:      Violation of this rule is an undefined behavior, it cannot be
                 tested.

*/

import utils.assert.Assert

foreign func func_01(x: CPointer<Int32>): Unit

main() {
    var Arg : Int32 = 777;
    unsafe { func_01(inout Arg) }
    Assert.equals(877, Arg)
}
