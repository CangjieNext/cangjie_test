/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_a02_01

  @Level:         1

  @Assertion:    11(2) The members of a package are top-level definitions or declarations that can be 
                 defined or declared within the source files in the package.
 
  @Description:  Check that members of a package can be defined within the source files in the package
                 and used within package

  @Mode:         run 

  @Negative:     no  

  @Structure:    complex-main

  @Dependencies: aux_test_a02_01.cj
 
*/

package package1121
import utils.assert.Assert

class C2 <: I {

}

main() {
    var obj = C2()

    Assert.equals(3.14, PI)
    Assert.equals("foo", foo())
    Assert.equals(23, C1.add(17, 6))
    Assert.equals(2023, S.currentYear)
    Assert.equals("Hello World", obj.hw("World"))
}