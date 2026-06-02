
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a03_01

  @Level:         1

  @Assertion:   4.23(3) When evaluating an assignment expression, the expression to the left of = is always evaluated
                first, then the expression to the right of =, and finally the assignment.
  @Description: Checks that the expression to the left of = is evaluated first, then the expression to the right of =,
                and finally the assignment.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore
  @Issue: 6156,6460

  @Comment:     Issue 6460 -- non-problem. The test is corrected according to the assertion.
*/

import utils.assert.Assert

class C {
    var x = 123
    var s = ""

    // Called to the left of the = operator.
    func f(y : Int64) {
        Assert.equals(y, x)
        s += "f"
        return this
    }

    // Called to the right of the = operator.
    func g(y : Int64, z : Int64) {
        Assert.equals(y, x)
        s += "g"
        return z
    }

    mut prop propX: Int64 {
        get() {
            f(x)
            x
        }
        set(newVal) {
            g(x, newVal)
            x = newVal
        }
    }
}


main() {
    var c = C()
    let x = c.x
    let y = 321
    c.f(x).x = c.g(x, y)
    Assert.equals(y, c.x)

    var c1 = C()
    c1.propX = c1.propX
    Assert.equals(123, c1.x)
    Assert.equals("fg", c1.s)
}
