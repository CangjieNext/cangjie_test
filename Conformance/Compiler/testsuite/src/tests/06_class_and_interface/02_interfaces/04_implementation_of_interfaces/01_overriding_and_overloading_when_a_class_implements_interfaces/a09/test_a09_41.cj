/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a09_41

  @Level:         1

  @Assertion: 6.2.4.1(9)
              If multiple interfaces contain multiple default implementations
              of the same function or property, the implementation type
              must implement the function or property and cannot inherit from the default implementation.

  @Description: Check that a struct can not omit implementation of an instance immutable property
                that has default implementations in two superinterfaces

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

interface I1 {
    prop p: Int64 {
        get() {
            1
        }
    }
}

interface I2 {
    prop p: Int64 {
        get() {
            1
        }
    }
}

struct A <: I1 & I2 {}

main() {
}