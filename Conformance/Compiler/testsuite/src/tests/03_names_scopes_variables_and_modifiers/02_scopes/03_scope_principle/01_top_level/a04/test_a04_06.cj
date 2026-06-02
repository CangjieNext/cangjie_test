/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        03_02_03_01_a04_06

  @Level:         1
  @Assertion:   3.2.3.1(4) They must be defined and initialized before they are used.
  @Comment:     Assertion about top-level variables, whose names are introduced by let and var.
  @Mode:        compileOnly
  @Negative:    yes
  @Structure:   single

*/

struct Struct1 {
  var num2 = num1
}

var num1 = 3.14

main() {
  var struct1 = Struct1()
  return 0
}