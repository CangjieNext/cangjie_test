/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a01_01

  @Level:         1

  @Assertion:   7.4(1) Properties, like functions, can be modified with modifiers, but only
                for the entire property, not for the getter or setter independently.

  @Description: Checks that properties can be modified with modifiers.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

class A1 {
  public mut prop a1 : UInt8 {
    get() { 0 }
    set(v) {}
  }
  static mut prop a2 : UInt16 {
    get() { 0 }
    set(v) {}
  }
  private mut prop a3 : UInt32 {
    get() { 0 }
    set(v) {}
  }
  protected mut prop a4 : UInt64 {
    get() { 0 }
    set(v) {}
  }
}

main() {
  return 0;
}


