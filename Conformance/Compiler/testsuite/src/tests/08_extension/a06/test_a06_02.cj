/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a06_02

  @Level:         1

  @Assertion:   8(6) Features that can be added include: Adding Static Member Properties.

  @Description: Checks that static member properties can be added to enum extension.

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
    static prop vProp: Int64 {
        get() { 12345 }
    }
}

main() {
    Assert.equals(12345, Foo.vProp)
}
