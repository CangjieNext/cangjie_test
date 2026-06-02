/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a13_02_package

  @Level:         1

  @Assertion:   10.1.2.1(13) 2) If c in a.b.c is a type name defined by class, 
                struct or enum, visible set includes static methods defined in the c.

  @Description:  Class with static routines is a member of package.
                 To call such routine need to use prefix pcheck.Klass. 

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a13_01_package.cj

*/

import pcheck.*
import pcheck

main() {
    pcheck.Klass.Check(i8)  
    pcheck.Klass.Check(i16) 
    pcheck.Klass.Check(i32) 
    pcheck.Klass.Check(i64) 
           
    pcheck.Klass.Check(u8)  
    pcheck.Klass.Check(u16) 
    pcheck.Klass.Check(u32) 
    pcheck.Klass.Check(u64) 
           
    pcheck.Klass.Check(f64) 
    pcheck.Klass.Check(f32) 
    pcheck.Klass.Check(f16) 
}
