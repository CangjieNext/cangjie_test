/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a06_03

  @Level:         1

  @Assertion: 6.1.1.2(6)
              Legal type arguments should be provided when the generic class is inherited.

  @Description: Check that it's illegal to instantiate an open superclass with paramteres that do not satisfy its constrains

  @Mode: compileonly

  @Negative: yes

  @Structure: single


*/

open class A<T1, T2> where T1 <: T2 {}
class B <: A<Any, Object> {}

main() {
}
