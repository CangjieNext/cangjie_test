/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a01_11

  @Level:         1

  @Assertion: 6.1.1.2(1)
              Only single inheritance between classes are supported.

  @Description: Check that a generic class can not inherit multiple classes and implement multiple interfaces

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006089

*/

interface I1 {}
interface I2 {}
interface I3 {}
interface I4 {}
interface I5 {}

class C1 {}
class C2 {}
abstract class C3 {}
abstract class C4 {}
abstract class C5 {}

class C<T> <: C1 & C2 & C3 & C4 & C5 & I1 & I2 & I3 & I4 & I5 {}

main() {
}
