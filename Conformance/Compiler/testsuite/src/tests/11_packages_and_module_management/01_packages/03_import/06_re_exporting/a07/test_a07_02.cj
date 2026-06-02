/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_06_a07_02

  @Level:         1

  @Assertion:    11.1.3.6(7) When other packages import declarations in the current package,
                 the re-exported content in the current package is automatically imported into 
                 other packages without manual import.
  
  @Description:  Check that re-exported content won't be automatically imported recursively.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a07_03.cj

*/

import pa3.foo3

main() {
    foo1()  //foo1 was automatically imported in pkga2 but it's missing in pkga3
    return 0
}