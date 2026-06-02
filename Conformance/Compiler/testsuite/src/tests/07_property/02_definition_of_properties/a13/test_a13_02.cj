/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a13_02

  @Level:         1

  @Assertion:   7.2(13) Properties do not support overloading or shadowing, and cannot be
                renamed with other members of the same level.

  @Description: Checks that property cannot be shadowed.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

open class A {
  var x: Int64 = 0
  public mut prop xx: Int64 {
    get() {
      x
    }
    set(v) {
      x = v
    }
  }
}

class B <: A {
  var y: Int32 = 0
  public mut prop xx: Int32 {
    get() {
      y
    }
    set(v) {
      y = v
    }
  }
}

main() {
  return 0;
}


