
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a34_01

  @Level:         1

  @Assertion:   4.23(34) Multi-assignment expressions can be thought of as syntactic sugar of the following form.
                The expressions on the right side of the assignment expression are evaluated first, and then the
                left-valued parts are assigned one by one from left to right.
  @Description: Checks that the expressions on the right side of the assignment expression are evaluated first, and
                then the left-valued parts are assigned one by one from left to right.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

class C {
    let s1 = "012345"
    var s2 = ""

    operator func[](i : Int64) {
        s2 += "g" + s1[i..i+1]
        return s1[i]
    }

    operator func[](i : Int64, value! : Byte) {
        s2 += "s" + s1[i..i+1] + Rune(value).toString()
    }
}

main() {
    var x = C()
    (x[0], x[1], x[2]) = (x[3], x[4], x[5])
    println(x.s2)
    Assert.equals("g3g4g5s03s14s25", x.s2)
    
    return 0
}
