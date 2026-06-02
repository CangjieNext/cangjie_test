/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_01_a02_03

  @Level:         1

  @Assertion:   7.1(2) Properties declared without a mut modifier need to define getter
                implementation.

  @Description: Checks that property without mut need to define getter.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

class A {
  private var p: Int64 = 0
  prop pval: Int64 {
    set(value) {
      p = value
    }
  }
}

main() {
  var a = A()
  return 0;
}


