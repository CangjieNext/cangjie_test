/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a13_01

  @Level:         1

  @Assertion:   7.2(13) Properties do not support overloading or shadowing, and cannot be
                renamed with other members of the same level.

  @Description: Checks that property cannot be overloaded.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

class A {
  var x1: Int64 = 0
  var x2: Int32 = 0
  mut prop xx: Int64 {
    get() {
      x1
    }
    set(v) {
      x1 = v
    }
  }
  mut prop xx: Int32 {
    get() {
      x2
    }
    set(v) {
      x2 = v
    }
  }
}

main() {
  return 0;
}


