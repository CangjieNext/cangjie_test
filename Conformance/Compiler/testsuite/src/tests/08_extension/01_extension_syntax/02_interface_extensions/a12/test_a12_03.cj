/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a12_03

  @Level:         1

  @Assertion:   8.1.2(12)
                interface I1 {}
                class Foo <: I1 {}
                extend Foo <: I1 {} // error
                interface I2<T> {}
                class Goo<T> <: I2<Int32> {}
                extend Goo<T> <: I2<Int32> {} // error
                extend Goo<T> <: I2<T> {} // ok

  @Description: Checks that extend extend Goo<T> <: I2<Int32> {} in the example is a error.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single


*/

interface I2<T> {}

class Goo<T> <: I2<Int32> {}

extend Goo<T> <: I2<Int32> {} // error

main() { }
