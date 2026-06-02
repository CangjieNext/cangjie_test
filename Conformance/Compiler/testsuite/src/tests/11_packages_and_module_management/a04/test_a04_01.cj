/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_a04_01

  @Level:         1

  @Assertion:    11(4) A module is a collection of packages and is the minimum unit to be released 
                 to third-party developers
 
  @Description:  Check that module can contain several packages

  @Mode:         run 

  @Negative:     no  

  @Structure:    complex-main

  @Dependencies: aux_test_a04_01.cj aux_test_a04_02.cj
 
*/

import packagemath.*
import packagephysics.*

import utils.assert.Assert

main() {
    Assert.equals(2023, add(2022, 1))
    Assert.equals(9.8, G)
}
