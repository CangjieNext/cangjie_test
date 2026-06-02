/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a04_02

  @Level:         1

  @Assertion:   8(4) Features that can be added include: Adding Operator Overloading.

  @Description: Checks that operator overloading can be added to enum extension.

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
    func toInt() {
        match (this) {
            case A => 0
            case B => 1
            case C => 2
        }
    }

    operator func +(v: Int64): Foo {
        var a = this.toInt()
        let b = a + v
        match (b % 3) {
            case 1 => B
            case 2 => C
            case _ => A
        }
    }

    operator func ==(v: Foo): Bool {
        v.toInt() == this.toInt()
    }
}

main() {
    var x = Foo.B
    Assert.isTrue(Foo.C == x + 1)
    Assert.isTrue(Foo.A == x + 2)
}
