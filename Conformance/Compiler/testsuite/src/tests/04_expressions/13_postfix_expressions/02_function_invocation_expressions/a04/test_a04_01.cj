/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_02_a04_01

  @Level:         1

  @Assertion: 4.13.2(4) Otherwise, if T overloads the operator (), f(x) should try to call the overloaded function (see
              Operators that can be Overloaded)

  @Description: Check that overloaded operator() means the overloaded function call.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    operator func() (x: Int64) {
        return 1
    }

    operator func() (x: String) {
        return 2
    }
}

main() {
    let x = C()

    let r1 = x(3)
    Assert.equals(1, r1)

    let r2 = x("hello")
    Assert.equals(2, r2)
}

