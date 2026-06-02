/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a06_01

  @Level:         1

  @Assertion:    11.2(6) The access level of the right value of the assignment and 
                 variable declaration expressions can be different from that of the left value. 
 
  @Description:  Check that access level of the right value of the assignment and variable declaration
                 expressions can be different from left value.

  @Mode:         run 

  @Negative:     no  

  @Structure:    complex-main

  @Dependencies: aux_test_a06_01.cj
 
*/

package pkg1
import pkga1.*
import utils.assert.Assert

main() {
    Assert.equals(3.14, PI)
    Assert.equals("foo1", foo1())
    Assert.equals(9.8, A2)
    Assert.equals("foo2", AUXTESTA0601)
}