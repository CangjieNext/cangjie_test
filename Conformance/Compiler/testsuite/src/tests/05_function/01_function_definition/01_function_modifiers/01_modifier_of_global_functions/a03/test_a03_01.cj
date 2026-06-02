/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_01_a03_01

  @Level:         1

  @Assertion:     5.1.1.1(3) If no accessible modifier is provided, the function can only be accessed within the 
                  current package.  

  @Description:   Check that global function defined without public modifier can be accessed inside other module
                  in same package.

  @Module:        mod_05_01_01_01_a03

  @Mode:          run

  @Negative:      no

  @Structure:     complex-main

  @Dependencies:  aux_module.cj

*/
package pkg

import utils.assert.Assert

func myFunc(){
  f12()
}

main() {
  Assert.equals("from other file in same package", myFunc())
}
