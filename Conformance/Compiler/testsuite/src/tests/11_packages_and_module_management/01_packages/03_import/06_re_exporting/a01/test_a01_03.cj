/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_06_a01_03

  @Level:         1

  @Assertion:    11.1.3.6(1) The imported content can be re-exported by using public import.  

  @Description:  Check that content imported without `public` keyword cannot be re-exported

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a01_04.cj 

 */

import p4.AuxTestA0101

main() {
    AuxTestA0101.sum(5, 5)
    return 0
}