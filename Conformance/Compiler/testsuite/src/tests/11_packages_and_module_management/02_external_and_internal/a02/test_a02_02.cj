/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a02_02

  @Level:         1

  @Assertion:    11.2(2) When a declaration is modified by public, it indicates that the 
                 declaration can be directly imported into other packages or can be accessed
                 in the form of package name.xxx after the package is imported.  
 
  @Description:  Check that declaration modified by public can be accessed after package is imported

  @Mode:         run 

  @Negative:     no  

  @Structure:    complex-main

  @Dependencies: aux_test_a02_01.cj
 
*/

package pkg2

import pkga1.*
import pkga1
import utils.assert.Assert

main() {
    Assert.equals("pkga1", auxTestA0201)
    Assert.equals("pkga1", pkga1.auxTestA0201)
    return 0
}
