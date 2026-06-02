/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_a06_03

  @Level:         1

  @Assertion: 6.2.3(6)
              For example:
              interface I1 {}
              interface I2 <: I1 & I1 {} // error
              interface I3<T> {}
              interface I4 <: I3<Int32> & I3<Int32> {} // error
              interface I5<T> <: I3<T> & I3<Int32> {} // ok

  @Description: Check the second negative case from the example

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I1 {}
interface I3<T> {}
interface I4 <: I3<Int32> & I3<Int32> {} // error
interface I5<T> <: I3<T> & I3<Int32> {} // ok

main() {
}