/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_05_a09_02

  @Level:         1

  @Assertion:    11.1.3.5(9) If the imported definitions or declarations have the same name 
                 as the top-level definitions or declarations in the current package and do 
                 not constitute function overloading, they will be shadowed according to the
                 scope rule mentioned in Shadowing,  while if the imported definitions or 
                 declarations have the same name as the top-level definitions or declaration 
                 in the current package and constitutes function overloading, the function 
                 resolution is made according to the function overloading rule in Generic 
                 Function Overloading and Function Overloading. 

  @Description:  Check that imported definitions or declarations with the same name as
                 the top-level definitions or declarations and constitutes function overloading
                 the function resolution is made according to the function overloading rule in Generic 
                 Function Overloading and Function Overloading.

  @Mode:         run

  @Negative:     no

  @CompileWarning:  yes

  @Structure:    complex-main

  @Dependencies: aux_test_a09_01.cj aux_test_a09_02.cj aux_test_a09_03.cj

  @Module:       m4

 */
package p4

import p1.add
import p2.add
import p3.add
import utils.assert.Assert

func add(p1: Float16, p2: Float16) {
    return p1 + p2
}

main() {
    Assert.equals(5, add(5))
    Assert.equals(3, add(1, 2))
    Assert.equals(6, add(1, 2, 3))
    Assert.equals(20.23, add(20.00, 0.23))
}
