/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a05_03

  @Level:         1

  @Assertion:   8(5) Features that can be added include: Adding Instance Member Properties.

  @Description: Checks that instance member properties can be added to struct extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue: 6124


*/

import utils.assert.Assert

struct Foo {
    var t: String

    init (f: String) {
        this.t = f
    }
}

extend Foo {
    mut prop token: String {
        get() { t }
        set(v) { t = v }
    }
}

main() {
    var x = Foo("AAA")
    Assert.equals("AAA", x.token)
    x.token = "BBB"
    Assert.equals("BBB", x.token)
}
