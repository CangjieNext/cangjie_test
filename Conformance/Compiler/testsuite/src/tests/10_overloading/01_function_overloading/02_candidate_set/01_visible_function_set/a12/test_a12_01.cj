/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a12_01

  @Level:         1

  @Assertion:   10.1.2.1(12) For function calls with a qualifier, e.g. c.f(...),
                the visible set includes functions introduced in the following ways:
                1) If c is the name of a package and f is a function defined at the 
                top of the package, it does not include functions imported by way of import clause.

  @Description: Overloading in the top level of the package. In file we see
                overloaded calls, which routines are declared in package pcheck.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a12_01_package.cj aux_test_a12_02_package.cj

*/

import pcheck
import pcheck.*

main() {
    pcheck.Check(i8)  
    pcheck.Check(i16) 
    pcheck.Check(i32) 
    pcheck.Check(i64) 
           
    pcheck.Check(u8)  
    pcheck.Check(u16) 
    pcheck.Check(u32) 
    pcheck.Check(u64) 
           
    pcheck.Check(f64) 
    pcheck.Check(f32) 
    pcheck.Check(f16) 
}
