/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a09_02

  @Level:         1

  @Assertion:   7.2(9) Properties are divided into instance member properties and static
                member properties.

  @Description: Checks that instance member properties and static member properties work
                as expected.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

class A {
  private var imv: Int64 = 0
  static var smv: Int64 = 0
  mut prop imv_prop: Int64 {
    get() {
      imv
    }
    set(v) {
      imv = v
    }
  }
  static mut prop smv_prop: Int64 {
    get() {
      smv
    }
    set(v) {
      smv = v
    }
  }
}

main() {
  var x1 = A()
  var x2 = A()
  x1.imv_prop = 1
  x2.imv_prop = 2
  x1.smv_prop = 3
  return 0;
}


