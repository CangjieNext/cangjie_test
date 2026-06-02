/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a01_02

  @Level:         1

  @Assertion:   7.2(1) Properties can be defined in interface, class, struct, enum, extend

  @Description: Checks that property can be defined in class.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

class A1 {
  prop a1 : Int32 {
    get() { 0 }
  }
  mut prop a2 : Int32 {
    get() { 0 }
    set(v) {}
  }
}

main() {
    return 0;
}


