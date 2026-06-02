/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_06_a01_01

  @Level:         1

  @Assertion:    11.1.3.6(1) The imported content can be re-exported by using public import.  

  @Description:  Check that imported content can be re-exported by using public import packageName.*

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a01_02.cj 

 */

import p2.*
import utils.assert.Assert

main() {
    Assert.equals(10, AuxTestA0101.sum(5, 5))
}