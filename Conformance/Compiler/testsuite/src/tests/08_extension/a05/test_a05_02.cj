/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a05_02

  @Level:         1

  @Assertion:   8(5) Features that can be added include: Adding Instance Member Properties.

  @Description: Checks that instance member properties can be added to enum extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue: 6124


*/

import utils.assert.Assert

enum Foo {
    | A 
    | B 
    | C
}

extend Foo {
    prop asInt: Int64 {
        get() {
            match (this) {
                case A => 0
                case B => 1
                case C => 2
            }
        }
    }
}

main() {
  var x = Foo.B
  Assert.equals(1, x.asInt)
  Assert.equals(2, Foo.C.asInt)
}
