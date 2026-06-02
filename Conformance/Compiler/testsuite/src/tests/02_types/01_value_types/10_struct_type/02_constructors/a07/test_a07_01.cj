/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a07_01

  @Level:         1

  @Assertion: 2.1.10.2(7)
              The parameter list contains two types of parameters: regular parameters
              and non-static member variable parameters.

  @Description: Check that the parameter list of the primary constructor
                has the mentioned types of parameters

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var constructor_counter = 0

// regular unnamed parameters
struct Ru {
    Ru(x: Int64, y: Int64) {
        constructor_counter++
    }
}

// regular named parameters
struct Rn {
    Rn(x!: String) {
        constructor_counter++
    }
}

// instance member variable unnamed parameters
struct Cu {
    Cu(let x: Int64, private var y: Rune) {
        constructor_counter++
    }
}

// instance member variable named parameters
struct Cn {
    Cn(let a!: Bool, public var f!: String) {
        constructor_counter++
    }
}

// regular parameters
struct RuRn {
    RuRn(x: Int64, y!: Int64) {
        constructor_counter++
    }
}

// instance member variable parameters
struct CuCn {
    CuCn(var a: String, let b!: Rune) {
        constructor_counter++
    }
}

// unnamed regular parameters and instance member variable parameters
struct RuCuCn {
    RuCuCn(a: Rune, let b: String, var c!: Int64) {
        constructor_counter++
    }
}

// regular parameters and instance member variable named parameters
struct RuRnCn {
    RuRnCn(a: Int64, b!: Float64, let c!: Bool) {
        constructor_counter++
    }
}

main() {
    Assert.equals(0, constructor_counter)

    var case1 = Ru(1, 2)
    Assert.equals(1, constructor_counter)

    var case2 = Rn(x: "AAAA")
    Assert.equals(2, constructor_counter)

    var case3 = Cu(20, r'1')
    Assert.equals(3, constructor_counter)

    var case4 = Cn(a: false, f: "")
    Assert.equals(4, constructor_counter)

    var case5 = RuRn(10, y: 20)
    Assert.equals(5, constructor_counter)

    var case6 = CuCn("", b: r'a')
    Assert.equals(6, constructor_counter)

    var case7 = RuCuCn(r'0', "0", c: 0)
    Assert.equals(7, constructor_counter)

    var case8 = RuRnCn(12, b:.5, c: true)
    Assert.equals(8, constructor_counter)
}
