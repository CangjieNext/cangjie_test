/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a07_02

  @Level:         1

  @Assertion:    11.1.3(7) import declaration must be after the package declaration and before 
                 any other declaration. 
 
  @Description:  Check that import declaration must be after the package declaration and before 
                 any other declaration. 

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a07_01.cj

*/
import package2.*

package package1

main() {
    return 0
}