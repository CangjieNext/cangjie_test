/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a35_05

  @Level:         1

  @Assertion: 6.1.2.1(35)
              The constructor is specified using the init keyword and cannot contain the func keyword

  @Description: Check that a protected constructor can not contain the 'func' keyword

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  protected func init(a: Int64, b: String) {}
}

main() {
}