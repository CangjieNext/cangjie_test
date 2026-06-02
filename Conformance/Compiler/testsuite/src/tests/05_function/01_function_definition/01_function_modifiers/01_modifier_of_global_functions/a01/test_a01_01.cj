/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_01_a01_01

  @Level:         1

  @Assertion:     5.1.1.1(1) Note that the default accessibility is internal.

  @Description:   Check that top-level function defined without modifier can be accessed inside own package only.

  @Mode:          run

  @Negative:      no

  @Structure:     complex-main

  @Dependencies:  aux_module.cj aux_module_1.cj

  @Module:        mod_05_01_01_01_a01

*/
package pkg
import utils.assert.Assert
import pkg1 as O

main() {
  Assert.equals(myPublicFunc(),"func myInternalFunc can be accessed in own package with result : aux_module from my myInternalFunc")
  Assert.equals(myInternalFunc("05_01_01_01_a01_01"),"05_01_01_01_a01_01 from my myInternalFunc")

  Assert.equals(O.myPublicFunc1(),"func myInternalFunc1 can be accessed in own package with result : aux_module_1 from my myInternalFunc1")

}
