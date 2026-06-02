/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a03_02

  @Level:         1

  @Assertion:   7.4(3) Properties can use the access control modifiers private, protected and public.

  @Description: Checks that property can use the access control modifiers.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

struct A {
  mut prop a: Int64 {
    get() { 0 }
    set(v) {} 
  }
  private mut prop b: Int64 {
    get() { 0 }
    set(v) {} 
  }
  public mut prop d: Int64 {
    get() { 0 }
    set(v) {} 
  }
}

main() {
  return 0;
}


