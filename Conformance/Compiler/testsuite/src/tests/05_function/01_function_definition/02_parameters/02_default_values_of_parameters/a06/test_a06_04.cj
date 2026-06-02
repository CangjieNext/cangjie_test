/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a06_04

  @Level:         1

  @Assertion:     5.1.2.2(6) Operator functions cannot have optional parameters.

  @Description:   Check that struct member operator func can't be defined with optional parameters.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

struct myStruct { 
  var myStructVar: Int32 = 1
  operator func +(a!: Int32 = 6){ a + myStructVar } 
}  

main() {
}
