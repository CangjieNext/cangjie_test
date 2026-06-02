/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_05_a03_04

  @Level:         1

  @Assertion: 6.2.5(3)
              The Any interface can be explicitly declared at the type definition,
              or implicitly implemented by the compiler if it is not,
              but cannot be reimplemented using extensions.

  @Description: Check that a generic class that does not explicitly implement the Any type
                can not be extended to implement Any

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A<T> {}

extend A<T> <: Any {}

main() {
}