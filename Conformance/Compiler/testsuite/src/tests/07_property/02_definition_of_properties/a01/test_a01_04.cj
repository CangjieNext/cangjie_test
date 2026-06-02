/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a01_04

  @Level:         1

  @Assertion:   7.2(1) Properties can be defined in interface, class, struct, enum, extend

  @Description: Checks that property can be defined in enum.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124, 0006153


*/

enum C {
  CASE_C
  prop i: Int64 {
    get() { 0 } 
  }
}

main() {
    return 0;
}


