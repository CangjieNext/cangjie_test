/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a08_01

  @Level:         1

  @Assertion:   8(8) Extensions is a function that is appended after the type definition.

  @Description: Checks that adding extensions after type definition is ok.

  @Mode:        run
  @Negative:    no
  @Structure:   complex-aux
  @Dependencies: aux_a08_01.cj
  @Issue:       


*/

import utils.assert.Assert
import p.AuxA0801

class Foo {
    var x: Int64 = 0
    var y: Int64 = 0

    init (a: Int64, b: Int64) {
        x = a
        y = b
    }
}

extend Foo {
    func min(): Int64  {
        if (x < y) { return x }
        y
    }
}

extend Foo {
    func max(): Int64  {
        if (x > y) { return x }
        y
    }
}

extend AuxA0801 {
    operator func -() { -x } 
}

main() {
    let x = Foo(4, 5)
    Assert.equals(4, x.min())
    Assert.equals(5, x.max())
    var c = AuxA0801(-7)
    Assert.equals(7, -c)
}
