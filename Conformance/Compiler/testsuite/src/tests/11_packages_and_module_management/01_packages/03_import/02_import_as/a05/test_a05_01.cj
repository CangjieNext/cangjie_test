/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_02_a05_01

  @Level:         1

  @Assertion:    11.1.3.2(5) According to the rules in Scope level, the scope level 
                 of the imported name is lower than the top-level scope level of the 
                 current package.
 
  @Description:  Check that the scope level of the imported name is lower than the 
                 top-level scope level of the current package.

  @Mode:         run 

  @Negative:     no  

  @Structure:    complex-main

  @Dependencies: aux_test_a05_01.cj
 
*/
package p2
import p1
import utils.assert.Assert

func foo() {
    "p2 foo"
}

main() {
    Assert.equals("p2 foo", foo())
    Assert.equals("p1 foo", p1.foo())
    return 0
}
