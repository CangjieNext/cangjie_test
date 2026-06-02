/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a55_01

  @Level:         1

  @Assertion: 6.1.2.1(55)
              If a constructor does not explicitly call other constructors,
              ensure that all instance member variables declared in this class
              have been initialized before returned from the constructor.
              Otherwise, an error will be reported during compilation.

  @Description: Check that a class is instantiated correctly if all instance variables
                are initialized in all conctructors

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var id = 0

// No instance variables
class Test1 {
    public init() {
        id = 1
    }

    init(x: Int64) {
        id = 2
    }

    protected init(a!: String, b!: Rune) {
        id = 3
    }
}

// All instance variables have initial values
class Test2 {
    let x = 1
    var y = 2
    public let s = "s"
    private var d = (1, 1, 1)

    init() {
        id = 4
    }

    public init(a: () -> Rune) {
        id = 5
    }

    protected init(f: (String, String), g!: (Bool, Bool, Bool, String) = (false, false, true, "")) {
        id = 6
    } 
}

// Constructors initialize instance variables
class Test3 {
    let a = 1
    var b = 7

    private let x: Int64
    public var y: Rune

    init() {
        x = 1
        y = r'a'

        id = 7
    }

    init(x: Int64, y: Float64) {
        this.x = x
        this.y = r'b'

        id = 8
    }

    init(y: Unit, yy: Unit, z: Unit, zz: Unit, zzz: Unit) {
        x = 12
        this.y = r'x'

        id = 9
    }
}

main() {
    let case1 = Test1()
    Assert.equals(1, id)

    let case2 = Test1(318)
    Assert.equals(2, id)

    let case3 = Test1(a: "", b: r'd')
    Assert.equals(3, id)

    let case4 = Test2()
    Assert.equals(4, id)

    let case5 = Test2({ => r't'})
    Assert.equals(5, id)

    let case6 = Test2(("", ""))
    Assert.equals(6, id)

    let case7 = Test3()
    Assert.equals(7, id)

    let case8 = Test3(15, 0.15)
    Assert.equals(8, id)

    let case9 = Test3((), (), () , () , ())
    Assert.equals(9, id)
}