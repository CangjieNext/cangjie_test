/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a11_02

  @Level:         1

  @Assertion:   7.2(11) Static member properties can only be accessed by static members.

  @Description: Checks that static member properties can be accessed by instance members.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124, 0006168


*/

class A {
  static var smv: Int64 = 0
  static mut prop smv_prop: Int64 {
    get() {
      smv
    }
    set(v) {
      smv = v
    }
  }
  func i_member(): Int64 {
    smv_prop
  } 
}

main() {
  let x = A()
  let y = x.i_member()
  return 0;
}


