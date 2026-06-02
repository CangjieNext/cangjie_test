/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a09_02_package

  @Level:         1

  @Assertion:   10.1.2.1(9) 4) Functions defined in the top level of the package

  @Description:  Overloaded calls. Routines body and constants are in other file

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a09_01_package.cj

*/


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
