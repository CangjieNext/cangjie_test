/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_01_01_a03_01

  @Level:         1

  @Assertion:    11.1.1.1(3) Moreover, the package name should correspond to the relative path
                 of the current source file folder relative to the root of the source file, 
                 separated by ’.  ’ between two adjacent directory names.

  @Description:  Check that package name should correspond to the relative path

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: dir1/aux_test_a03_01.cj dir1/dir2/aux_test_a03_02.cj
 

*/

import default.dir1
import default.dir1.dir2

import utils.assert.Assert

main() {
    Assert.equals("aux_test_a03_01", dir1.packageNameStr())
    Assert.equals("aux_test_a03_02", dir2.packageNameStr())
}

