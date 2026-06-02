/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a13_05_neg

  @Level:         1

  @Assertion:   10.1.2.1(13) 2) If c in a.b.c is a type name defined by class, 
                struct or enum, visible set includes static methods defined in the c.

  @Description:  Compiler emits error as meet call of undefined overloaded routine 

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a13_01_package.cj

*/

import pcheck.*

main() {
    pcheck.Klass.Check(IntNative(1))  
}
