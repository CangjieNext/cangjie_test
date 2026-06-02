/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a03_03

  @Level:         1

  @Assertion:   8(3) Features that can be added include: Adding Static Member Functions.

  @Description: Checks that static member function can be added to struct extension.

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
    static func fullName(v: Foo): String {
        v.fname + " " + v.sname
    }
}

main() {
    var x = Foo("AAA", "BBB")
    Assert.equals("AAA BBB", Foo.fullName(x))
}
