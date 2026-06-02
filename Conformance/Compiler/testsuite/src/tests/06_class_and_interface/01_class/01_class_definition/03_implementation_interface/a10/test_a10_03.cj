/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a10_03

  @Level:         1

  @Assertion: 6.1.1.3(10)
              For example:
              interface I1 {}
              class C1 <: I1 & I1 {} // error
              interface I2<T> {}
              class C2 <: I2<Int32> & I2<Int32> {} // error
              class C3<T> <: I2<T> & I2<Int32> {} // ok

  @Description: Check the second negative case from the example

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I1 {}
interface I2<T> {}
class C2 <: I2<Int32> & I2<Int32> {} // error
class C3<T> <: I2<T> & I2<Int32> {} // ok

main() {
}
