/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a02_02

  @Level:         1

  @Assertion:   8(2) Features that can be added include: Adding Instance Member Functions.

  @Description: Checks that instance member function can be added to enum extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

enum Foo {
    | A 
    | B 
    | C
}

extend Foo {
    func toInt(): Int64 {
        match (this) {
            case A => 100
            case B => 101
            case C => 102
        }
    }
}

main() {
    var x = Foo.B
    Assert.equals(101, x.toInt())
}
