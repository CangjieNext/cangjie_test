/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a02_06

  @Level:         1

  @Assertion:     5.1(2) A function is declared with the keyword func.

  @Description:   Check that interface static member function declaration w/o keyword func will produce error.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
interface myInterface { 
  static f(): Unit 
} 

main() {
}
