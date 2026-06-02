/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_01_a02_03

  @Level:         1

  @Assertion:     5.1.1.1(2) public: The function can be accessed in other packages.

  @Description:   Check that non-imported top-level function defined with 'public' modifier can't be accessed
                  outside own package.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     complex-main

  @Dependencies:  aux_module.cj

*/
package pkg
import mod_05_01_01_01_a02.pkg.myPublicFunc1 as myPublicFunc1

main() {
  var myVar = myPublicFunc2()
}
