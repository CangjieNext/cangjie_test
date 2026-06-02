/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a02_03

  @Level:         1

  @Assertion:   8(2) Features that can be added include: Adding Instance Member Functions.

  @Description: Checks that instance member function can be added to struct extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

struct Foo {
    let fname: String
    let sname: String

    init (f: String, s: String) {
        this.fname = f
        this.sname = s
    }
}

extend Foo {
    func fullName(): String {
        this.fname + " " + this.sname
    }
}

main() {
    var x = Foo("AAA", "BBB")
    Assert.equals("AAA BBB", x.fullName())
}
