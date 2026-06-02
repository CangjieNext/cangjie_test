/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_01_a01_02

  @Level:         1

  @Assertion:     5.1.1.1(1) Note that the default accessibility is internal.

  @Description:   Check that top-level function defined without modifier can't be accessed outside own package.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     complex-main

  @Dependencies:  aux_module_1.cj

*/
package pkg
import mod_05_01_01_01_a01_1.pkg1.* as O.*

main() {
  var myVar = O.myInternalFunc1("05_01_01_01_a01_01")

}
