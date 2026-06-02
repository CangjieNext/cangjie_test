/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_05_a01_01

  @Level:         1

  @Assertion:    11.1.3.5(1) A package can import several different packages
 
  @Description:  Check that package can import several different packages

  @Mode:         compileonly 

  @Negative:     no  

  @Structure:    complex-main

  @Dependencies: aux_test_a01_01.cj aux_test_a01_02.cj aux_test_a01_03.cj
 
*/

import p1.* 
import p2.auxTestA0102 as p2n
import p3 as package3

main() {
    return 0
}
