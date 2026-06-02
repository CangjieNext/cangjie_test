/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_01_a10_02

  @Level:         1

  @Assertion:   7.1(10) Properties are different from fields in that they cannot be assigned
                initial values and must be declared with types

  @Description: Checks that property cannot be assigned initial values.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

class A {
  var i1 = 0
  mut prop i2: Int64 {
    get() {
      i1
    }
    set(value) {
      i1 = value
    }
  } = 0
}

main() {
  let x = A()
}
