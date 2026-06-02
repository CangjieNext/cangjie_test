/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_06_a05_02

  @Level:         1

  @Assertion:    11.1.3.6(5) If the current package imports a series of declarations 
                 that need to be exported along with other top-level declarations in
                 the current package, these declarations must be decorated with the 
                 public import keyword. 
 
  @Description:  Check that declarations imported without `public` keyword won't be 
                 imported along with top-level declarations

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a05_02.cj

 */

package p3

import p2.*

main() {
    currentYear
    return 0
}
