/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_01_a06_02

  @Level:         1
  @Assertion:       2.1.11.1(6)   It is not allowed to define a constructor with empty parentheses, and the type of a 
  constructor without parameters is not a function type but just the type of the enum being defined.

  @Description:     Checks that  it is not allowed to use empty parentheses for enum instantiation

  @Mode:            compileonly
  @Negative:        yes
  @Structure:       single

  @Comment:

*/

enum A {
    B
}

let b = B()

main() {
}
