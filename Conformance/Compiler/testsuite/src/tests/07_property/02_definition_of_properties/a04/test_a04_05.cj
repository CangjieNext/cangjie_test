/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a04_05

  @Level:         1

  @Assertion:   7.2(4) When implementing an abstract property for an implementation type, it
                must maintain the same name, the same type, and the same mut modifier.

  @Description: Checks that implementation of abstract property must maintain the same mut modifier.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

interface I {
  prop i1: Int64
}

class C <: I {
  protected mut prop i1: Int64 {
    get() { 0 }
    set(v) {}
  }
}

main() {
    return 0;
}


