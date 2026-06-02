/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a06_03

  @Level:         1

  @Assertion:   8(6) Features that can be added include: Adding Static Member Properties.

  @Description: Checks that static member properties can be added to struct extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue: 6124


*/

import utils.assert.Assert

struct Foo {
    static var t: String = ""
}

extend Foo {
    static mut prop vProp: String {
        get() { t }
        set(v) { t = v }
    }
}

main() {
    Foo.vProp = "Hello"
    Assert.equals("Hello", Foo.vProp)
}
