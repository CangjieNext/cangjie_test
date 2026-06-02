/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_02_a09_04

  @Level:         1

  @Assertion:    3.3.2.2(9) Initialization expression e cannot depend with uninitialized global or
                 static variables. The compiler performs a conservative analysis and considers that e
                 may access uninitialized global variables and static variables then reports an error.
                 The detailed analysis depends on the implementation of the compiler and is not
                 specified in the specification.

  @Description:  Checks that compiler cannot find the order for initializing global variables (circular dependency).

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a09_04.cj

  @Issue:        0006065

*/

var gInt1: Int32 = gInt2

main() {
}
