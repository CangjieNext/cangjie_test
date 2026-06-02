/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a05_02

  @Level:         1

  @Assertion:    11.2(5) The access level is specified as follows based on the accessible scope: 
    • Top-level access level:  external > internal 
 
  @Description:  Check that keyword `public` give declaration external access level

  @Mode:         compileonly 

  @Negative:     no  

  @Structure:    complex-main

  @Dependencies: aux_test_a05_01.cj
 
*/

package pkg2
import pkga1.G

main() {
    return 0
}