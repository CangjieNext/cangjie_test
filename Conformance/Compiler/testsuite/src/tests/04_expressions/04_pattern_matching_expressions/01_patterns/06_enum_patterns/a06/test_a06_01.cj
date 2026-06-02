/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a06_01

  @Level:         1

  @Assertion: 4.4.1.6(6)
              enum Foo {
                  A | B | C
              }

              func f() {
                  let x = Foo.A
                  match (x) {
                      case A => 0 // enum pattern
                      case B => 1 // enum pattern
                      case C => 2 // enum pattern
                      case D => 3 // binding pattern
                  }
              }


  @Description: Check that the Spec example works.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

enum Foo {
    A | B | C
}

func f() {
    let x = Foo.A
    match (x) {
        case A => 0 // enum pattern
        case B => 1 // enum pattern
        case C => 2 // enum pattern
        case D => 3 // binding pattern
    }
}

main() {
    let v = f()
    Assert.equals(0, v)
}

