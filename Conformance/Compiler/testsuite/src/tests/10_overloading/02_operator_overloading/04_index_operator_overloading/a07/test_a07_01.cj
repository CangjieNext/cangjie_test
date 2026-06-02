/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a07_01

  @Level:         1

  @Assertion: 10.2.4(7)
              The sequence of arguments inside [] corresponds to the non-named arguments of the operator overload,
              which can be 1 or more, and can be of any type. 

  @Description: Check successful usage of seuqnce of arguments inside [] with different types.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C1 {
    operator func[](index: Int64) {
        x + index
    }

    operator func[](index: Int64, value!: Int64) {
        x = value + index
    }

    var x = 0
}

class C2 {
    operator func[](i1: Int64, i2: String) {
        (i, s)
    }

    operator func[](i1: Int64, i2: String, value!: String) {
        i = i1
        s = value + i2
    }

    var i = 0
    var s = ""
}

main() {
    // Case: single value index of Int64 type.
    var c1 = C1()
    var x1 = c1[1]
    Assert.equals(1, x1)
    c1[2] = 5
    Assert.equals(7, c1.x)
    Assert.equals(9, c1[2])

    // Case: two values index of Int64 and String type.
    var c2 = C2()
    c2.i = 5
    c2.s = "hello"
    var t2 = c2[1, "hi"]
    Assert.isTrue(t2 == (5, "hello"))
    c2[2, " world"] = "hello"
    Assert.equals(2, c2.i)
    Assert.equals("hello world", c2.s)
}

