/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a10_01

  @Level:         1

  @Assertion:   7.2(10) Among them, instance member properties can only be accessed by instances,
                and this, instance members and other static members can be accessed in the getter
                or setter implementation.

  @Description: Checks that instance/static members can be accessed by instance property.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124, 0006167


*/

class A {
  private var imv: Int64 = 0
  static var smv: Int64 = 0
  mut prop imv_prop: Int64 { // ok
    get() {
      i_member_get() + s_member_get()
    }
    set(v) {
      i_member_set(v)
      s_member_set(v)
    }
  }
  func i_member_get() : Int64 {
    imv
  }
  func i_member_set(a: Int64) {
    imv = a
  }
  func s_member_get() {
    smv
  }
  func s_member_set(a: Int64) {
    smv = a
  }
}

main() {
  var x1 = A()
  return 0;
}


