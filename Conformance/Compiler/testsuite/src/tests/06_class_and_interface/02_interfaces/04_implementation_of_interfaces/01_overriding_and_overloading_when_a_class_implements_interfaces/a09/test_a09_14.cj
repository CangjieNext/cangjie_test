/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a09_14

  @Level:         1

  @Assertion: 6.2.4.1(9)
              If multiple interfaces contain multiple default implementations
              of the same function or property, the implementation type
              must implement the function or property and cannot inherit from the default implementation.

  @Description: Check that an abstract class can not omit implementation of a static function
                that has default implementations in two superinterfaces

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I1 {
    static func f() {}
}

interface I2 {
    static func f() {}
}

abstract class A <: I1 & I2 {}

main() {
}