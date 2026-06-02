/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a08_01

  @Level:         1

  @Assertion: 10.2.4(8)
              The expression on the right side of = corresponds to the named parameter overloaded by the operator,
              there is one and only one named parameter, the name of the named parameter must be value, there can
              be no default value, and value can be of any type.

  @Description: Check that expression on the right side of = corresponds to the named parameter.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    operator func[](index: Int64, value!: Int64) {
        x = value
    }

    var x = 0
}

main() {
    var c = C()
    Assert.equals(0, c.x)
    c[0] = 5
    Assert.equals(5, c.x)
}

