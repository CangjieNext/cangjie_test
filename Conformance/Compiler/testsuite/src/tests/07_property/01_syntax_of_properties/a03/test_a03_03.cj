/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_01_a03_03

  @Level:         1

  @Assertion:   7.1(3) Properties declared with a mut modifier require both
                separate getter and setter implementations.

  @Description: Checks that mut property without setter is not compiled.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

class A {
  private var p: Int64 = 0
  mut prop pval: Int64 {
    get() {
      p
    }
  }
}

main() {
  var a = A()
  return 0;
}

