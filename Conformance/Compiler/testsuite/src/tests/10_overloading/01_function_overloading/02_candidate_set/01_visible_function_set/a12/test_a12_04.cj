/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a12_04

  @Level:         1

  @Assertion:   10.1.2.1(12) For function calls with a qualifier, e.g. c.f(...),
                the visible set includes functions introduced in the following ways:
                1) If c is the name of a package and f is a function defined at the 
                top of the package, it does not include functions imported by way of import clause.

  @Description: Checked that package pcheckWrong works                

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a12_01_package.cj aux_test_a12_02_package.cj

*/

import pcheckwrong.*
main() {
    Check(-i8)  
    Check(-i16) 
    Check(-i32) 
    Check(-i64) 
           
    Check(u8)  
    Check(u16) 
    Check(u32-1) 
    Check(u64) 
           
    Check(-f64) 
    Check(-f32) 
    Check(-f16) 
}
