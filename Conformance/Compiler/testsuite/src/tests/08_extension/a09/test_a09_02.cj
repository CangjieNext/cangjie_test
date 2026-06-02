/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a09_02

  @Level:         1

  @Assertion:   8(9) Extensions cannot destroy the encapsulation of the original type, so the
                following functions are forbidden.

  @Description: Checks that extensions cannot access private method in class.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       


*/


class Foo {
  private var x: Int64 = 0

  init (a: Int64) {
    x = a
  }

  private func getX() : Int64 { x }
}

extend Foo {
    func getX1() : Int64 { getX() }
}

main() { }
