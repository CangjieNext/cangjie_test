/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a13_03

  @Level:         1

  @Assertion:   7.4(13) Properties override/redef by subtypes must maintain the same mut
                modifier as the parent class, and must also maintain the same type.

  @Description: Checks that overriden property must have the same type.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

open class A {
  open public mut prop i1: Int64 {
    get() { 0 }
    set(v) { }
  }
}

class B <: A {
  override public mut prop i1: Int32 {
    get() { 1 } // ok
  }
}

main() {
  return 0;
}


