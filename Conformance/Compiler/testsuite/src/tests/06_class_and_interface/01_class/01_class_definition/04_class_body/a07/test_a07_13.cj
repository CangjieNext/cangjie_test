/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a07_13

  @Level:         1

  @Assertion: 6.1.1.4(7)
              A class can define only one primary constructor or not.

  @Description: Check that a generic class can not define several primary constructors with different signatures

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A<T1, T2> where T1 <: T2 {
  A() {}
  A(x: String) {}
  A(x: String, y: String) {}
  A(y: Int64) {}
  A(x: Rune) {}
  A(p: (String, String)) {}
}

main() {
}
