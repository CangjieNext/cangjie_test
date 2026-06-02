/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        03_02_03_01_a03_05

  @Level:         1
  @Assertion:   3.2.3.1(3) Top-level variables, whose names are introduced by let and var are only accessible 
                after they are defined (including the initialization) in the same source file, 
                but in the other files of the same package can be accessible.
  @Mode:        compileonly
  @Negative:    yes
  @Structure:   complex-main
  @Dependencies: ext_a03_05.cj
  @Issue:       0006030

*/

package somepackage2

import utils.assert.Assert

var str1 = "abcdf"
var str3 = str2

func foo() {
  return str2
}

main() {
  Assert.equals("abcdf", str2)
  Assert.equals("abcdf", str3)
  Assert.equals("abcdf", foo())
  return 0
}