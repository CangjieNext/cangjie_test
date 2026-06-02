/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_01_a02_01

  @Level:         1

  @Assertion:    11.1.1(2)
      The syntax of package declaration is as follows. 
      packageHeader 
           : 'package' packageNameIdentifier 
           ; 

      packageNameIdentifier 
         : identifier ('.' identifier)* 
         ; 

  @Description:  Check syntax of package declaration and packageNameIdentifier 

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a02_01.cj

*/

package package11

import utils.assert.Assert

main() {
    Assert.equals("foo", foo())
    return 0
}
