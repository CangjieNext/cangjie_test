/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_03_01_a01_03

  @Level:         1

  @Assertion:     5.3.1(1) Named arguments are arguments with argument-name : prefix.

  @Description:   Check that function with named parameter can't be invoked without named argument.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func myFunc(s!: String) {
  " AAA ${s} BBB"
}

main() {
  myFunc("SSS")
}
