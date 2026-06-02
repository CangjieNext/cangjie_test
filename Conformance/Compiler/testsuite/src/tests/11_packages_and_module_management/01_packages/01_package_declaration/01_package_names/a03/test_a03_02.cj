/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_01_01_a03_02

  @Level:         1

  @Assertion:    11.1.1.1(3) Moreover, the package name should correspond to the relative path
                 of the current source file folder relative to the root of the source file, 
                 separated by ’.  ’ between two adjacent directory names.

  @Description:  Check that package name should correspond to the relative path

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: dir1/aux_test_a03_01.cj dir1/dir2/aux_test_a03_02.cj
 

*/

import dir1.*
import dir2.dir1.*

main() {
    return 0
}

