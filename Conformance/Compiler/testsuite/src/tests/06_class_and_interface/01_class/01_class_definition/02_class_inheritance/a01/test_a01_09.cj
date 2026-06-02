/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a01_09

  @Level:         1

  @Assertion: 6.1.1.2(1)
              Only single inheritance between classes are supported.

  @Description: Check that a generic class can not inherit two abstract classes while implementing an interface

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006089

*/

interface I {}

abstract class A {}
abstract class B {}

class C<T> <: A & I & B {}

main() {
}
