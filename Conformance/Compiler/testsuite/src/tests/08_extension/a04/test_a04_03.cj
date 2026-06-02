/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a04_03

  @Level:         1

  @Assertion:   8(4) Features that can be added include: Adding Operator Overloading.

  @Description: Checks that operator overloading can be added to struct extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

struct Foo {
    let token: String

    init (f: String) {
        this.token = f
    }
}

extend Foo {
    operator func +(v: Foo): Foo {
        Foo(this.token + " " + v.token)
    }
}

main() {
    var x = Foo("AAA")
    var y = Foo("BBB")
    var z = x + y
    Assert.equals("AAA BBB", z.token)
}
