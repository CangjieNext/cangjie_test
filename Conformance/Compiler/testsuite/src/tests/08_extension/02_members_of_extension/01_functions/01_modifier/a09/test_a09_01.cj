/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_01_a09_01

  @Level:         1

  @Assertion:   8.2.1.1(9)
                struct Foo {
                    var i = 0
                }

                extend Foo {
                    mut func f() { // ok
                        i += 1
                    }
                }

  @Description: Checks the given example.

  @Mode:        run
  @Negative:    no
  @Structure:   single


*/

import utils.assert.Assert

struct Foo {
    var i = 0
}

extend Foo {
    mut func f() { // ok
        i += 1
    }
}

main() {
    var foo = Foo()
    Assert.equals(0, foo.i)
    foo.f()
    Assert.equals(1, foo.i)
    return 0
}
