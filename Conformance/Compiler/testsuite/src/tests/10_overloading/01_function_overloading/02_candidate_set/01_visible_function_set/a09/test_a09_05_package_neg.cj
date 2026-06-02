/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a09_05_package_neg

  @Level:         1

  @Assertion:   10.1.2.1(9) 4) Functions defined in the top level of the package

  @Description: Overloading in the top level of the package. In file we see
                overloaded calls, which routines are declared in package pcheck.
                Compiler emit error as function from IntNative was not fefined

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a09_03_package.cj

*/

import pcheck.*

main() {
    Check(i8)  
    Check(i16) 
    Check(i32) 
    Check(i64) 
           
    Check(u8)  
    Check(u16) 
    Check(u32) 
    Check(u64) 
           
    Check(f64) 
    Check(f32) 
    Check(f16) 
    Check(IntNative(0))
}
