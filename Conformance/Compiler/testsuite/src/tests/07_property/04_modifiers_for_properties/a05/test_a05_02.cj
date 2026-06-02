/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a05_02

  @Level:         1

  @Assertion:   7.4(5) Instance properties, like instance functions, can be modified with
                open and override.


  @Description: Checks that open property cannot be static.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

open class A {
  open static public mut prop a: Int64 {
    get() { 0 }
    set(v) {}
  }
}

main() {
  return 0;
}


