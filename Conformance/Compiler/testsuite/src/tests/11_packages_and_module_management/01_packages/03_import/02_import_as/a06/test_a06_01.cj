/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_02_a06_01

  @Level:         1

  @Assertion:    11.1.3.2(6) It should be noted that the scope level of the new name renamed by using 
                 import as is the same as the top-level scope level of the current package, and the 
                 renamed function can still participate in function overloading. 
 
  @Description:  Check that scope level of the new name renamed by using import as is the same as 
                 the top-level scope level of the current package

  @Mode:         run 

  @Negative:     no  

  @Structure:    complex-main

  @Dependencies: aux_test_a06_01.cj
 
*/

import p1.helloworld as hw
import utils.assert.Assert

func hw(p: String) {
    return "Hello ${p}"
}

main() {
    Assert.equals("Hello World", hw())
    Assert.equals("Hello Stranger", hw("Stranger"))
    return 0
}