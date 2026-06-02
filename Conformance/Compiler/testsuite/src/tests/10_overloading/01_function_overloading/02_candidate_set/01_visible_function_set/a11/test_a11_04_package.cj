/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a11_04_package

  @Level:         1

  @Assertion:   10.1.2.1(11) 6) Functions imported from other packages by importclause 

  @Description: Compiler emits error as call Check(IntNative) is not defined 
                in imported packages.  
                
  @Mode:         compileonly

  @Negative:     yes

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
    Check(IntNative(0)) 
}
