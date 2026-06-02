/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a29_01

  @Level:         1

  @Assertion: 2.1.10.2(29)
              In addition to the primary constructor,
              other constructors can be defined as usual,
              but the other constructors must form an overload
              with the corresponding constructor of the primary constructor.

  @Description: Check that a struct can define a primary constructor and init constructors
                as long as they have different signatures
  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var const_id = ""

// Primary constructor without parameters
// init constructors with various number of parameters
struct Test1 {
    Test1() {
        const_id = "T1:P()"
    }

    init(x: Int64) {
        const_id = "T1:init(Int64)"
    }

    init(x: Int64, y: Int64) {
        const_id = "T1:init(Int64, Int64)"
    }

    init(x: Int64, y: Int64, z: Int64) {
        const_id = "T1:init(Int64, Int64, Int64)"
    }
}

// Primary constructor with one parameter
// init constructors with one parameter of different types
struct Test2 {
    Test2(x: Bool) {
        const_id = "T2:P(Bool)"
    }

    init(x: Int64) {
        const_id = "T2:init(Int64)"
    }

    init(x: String) {
        const_id = "T2:init(String)"
    }

    init(x: Rune) {
        const_id = "T2:init(Rune)"
    }

    init(x: Array<Int64>) {
        const_id = "T2:init(Array<Int64>)"
    }

    init(x: (Rune, Rune)) {
        const_id = "T2:init((Rune, Rune))"
    }

    init(x: () -> Int64) {
        const_id = "T2:init(() -> Int64)"
    }

    init(x: Unit) {
        const_id = "T2:init(Unit)"
    }
}

// Primary constructor with generic paramters
struct Test3<T> {
    Test3(x: T, y: Bool) {
        const_id = "T3:P(T, Bool)"
    }

    init() {
        const_id = "T3:init()"
    }

    init(x: T) {
        const_id = "T3:init(T)"
    }

    init(x: Int64, y: Bool) {
        const_id = "T3:init(Int64, Bool)"
    }

    init(x:T, y!: Bool = false, z!: String) {
        const_id = "T3:init(T, Bool, String)"
    }
}

main() {
    let case1 = Test1()
    Assert.equals("T1:P()", const_id)

    let case2 = Test1(1)
    Assert.equals("T1:init(Int64)", const_id)

    let case3 = Test1(1, 2)
    Assert.equals("T1:init(Int64, Int64)", const_id)

    let case4 = Test1(1, 2, 3)
    Assert.equals("T1:init(Int64, Int64, Int64)", const_id)

    let case5 = Test2(false)
    Assert.equals("T2:P(Bool)", const_id)

    let case6 = Test2(1)
    Assert.equals("T2:init(Int64)", const_id)

    let case7 = Test2("")
    Assert.equals("T2:init(String)", const_id)

    let case8 = Test2(r'a')
    Assert.equals("T2:init(Rune)", const_id)

    let case9 = Test2([1, 1])
    Assert.equals("T2:init(Array<Int64>)", const_id)

    let case10 = Test2((r'a', r'b'))
    Assert.equals("T2:init((Rune, Rune))", const_id)

    let case11 = Test2({ => 1})
    Assert.equals("T2:init(() -> Int64)", const_id)

    let case12 = Test2(())
    Assert.equals("T2:init(Unit)", const_id)

    let case13 = Test3<String>("1", true)
    Assert.equals("T3:P(T, Bool)", const_id)

    let case14 = Test3<String>()
    Assert.equals("T3:init()", const_id)

    let case15 = Test3<String>("")
    Assert.equals("T3:init(T)", const_id)

    let case16 = Test3<String>(1, false)
    Assert.equals("T3:init(Int64, Bool)", const_id)

    let case17 = Test3<String>("", z: "")
    Assert.equals("T3:init(T, Bool, String)", const_id)
}