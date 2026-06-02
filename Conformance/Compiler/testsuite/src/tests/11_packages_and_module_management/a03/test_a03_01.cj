/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_a03_01

  @Level:         1

  @Assertion:    11(3) Top-level definitions or declarations of the same name are not 
                 allowed within a package (except function overloading).
 
  @Description:  Check that top-level functions with the same name allowed with 
                 function overloading

  @Mode:         run 

  @Negative:     no  

  @Structure:    complex-main

  @Dependencies: aux_test_a03_01.cj
 
*/
package package1131
import utils.assert.Assert

func hello(p: String) {
    return "Hello, ${p}"
}

func hello(p: Int8) {
    return "I said hello ${p} times"
}

main() {
    Assert.equals("Hello", hello())
    Assert.equals("Hello, Stranger", hello("Stranger"))
    Assert.equals("I said hello 28 times", hello(28))
}