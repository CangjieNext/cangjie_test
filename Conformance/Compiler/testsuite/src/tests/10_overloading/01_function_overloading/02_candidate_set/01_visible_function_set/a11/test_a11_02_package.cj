/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a11_02_package

  @Level:         1

  @Assertion:   10.1.2.1(11) 6) Functions imported from other packages by importclause 

  @Description: Overloading in the top level of the package.
                Used overloaded routines and constans are included via import clauses

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a11_01_package.cj

*/

import pcheck.i8 
import pcheck.i16
import pcheck.i32
import pcheck.i64
import pcheck.u8 
import pcheck.u16
import pcheck.u32
import pcheck.u64
import pcheck.f16
import pcheck.f32
import pcheck.f64
import pcheck.Check

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
}
