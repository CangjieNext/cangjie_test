/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_a06_01

  @Level:         1

  @Assertion:    14.2(6) Macros are classified into non-attribute macros and attributed macros.
                 Compared with non-attribute macros, attribute macros can analyze and transform the input of 
                 macros based on different attributes to obtain different output results.

  @Description:  Сheck that macros can be with and without attributes
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import std.ast.*
import aux_macros.*

main(): Unit {
    var t = @PlusOne(3)
    var t1 = @PlusOne[Int16](7_i16)
}
