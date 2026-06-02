/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_a07_02

  @Level:         1

  @Assertion: 6.2.3(7)
              When generic interface I3 is given a type argument Int32, compiler will emit an error:
              interface I1<T> {}
              interface I2<T> <: I1<T> & I1<Int32> {} // ok
              var a: I2<Int32> // error
              interface I3 <: I2<Int32> // error
  @Description: Check the first negative case from the example

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006379

*/


interface I1<T> {}
interface I2<T> <: I1<T> & I1<Int32> {} // ok
var a: I2<Int32> // error

main() {
}