/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_02_a02_01

  @Level:         1

  @Assertion: 4.13.2(2) A function invocation expression is used to call a function. See Chapter 5 Functions
              for more details about functions.

  @Description: Check that function invocation means function calling.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

func add(x: Int64, y: Int64) {
    return x + y
}

func id<T>(t: T) {
    return t
}

func sayMyName(name!: String) {
    return name
}

class C {
    func foo() {
        return 42
    }
}

main() {
    // Function call.
    let r1 = add(3, 4)
    Assert.equals(7, r1)

    // Generic function call.
    let r2 = id<String>("hello")
    Assert.equals("hello", r2)

    // Function with named argument call.
    let r3 = sayMyName(name: "Helen")
    Assert.equals("Helen", r3)

    // Member function call.
    let r4 = C().foo()
    Assert.equals(42, r4)
}

