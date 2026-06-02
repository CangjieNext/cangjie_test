/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a23_01

  @Level:         1

  @Assertion: 2.1.10.2(23)
              Main constructor body: The primary constructor does not allow calls to other constructors in this struct

  @Description: Check that the primary constructor works correctly if
                it does not contain any calls to other constructors

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var constructor_string = ""

struct A {
    A() {
        constructor_string += "A"
        func f () {
            return 4
        }
        func g(x: Int64) {
            return x + 1
        }

        var x = g(f())
        print(x)
    }
}


struct B {
    B(x: Int64) {
        constructor_string += "B"
        var y = x << 2
        var z = y * 20
        var a = {x: Int64 => x > 0}
        if (a(z)) {
            print(1)
        }
    }
}

main() {
    Assert.equals("", constructor_string)

    let case1 = A()
    Assert.equals("A", constructor_string)

    let case3 = B(1)
    Assert.equals("AB", constructor_string)
}

