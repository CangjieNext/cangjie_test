/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Base {
    public var name: String = "Alice"
}

class Derived1 <: Base {
    public var age: UInt8 = 18
}

class Derived2 <: Base {
    public var gender: String = "female"
}

main(): Int64 {
    var testVT = 1 is Int64 // testVT = true
    var testVT1 = 1 is String // testVT1 = false
    var testVT2 = true is Int64 // testVT2 = false
    var testVT3 = [1, 2, 3] is Array<Int64> // testVT3 = true

    let base1: Base = Base()
    let base2: Base = Derived1()
    let base3: Base = Derived2()

    let derived1: Derived1 = Derived1()
    let derived2: Derived2 = Derived2()

    var test = base1 is Base // test = true
    var test1 = base1 is Derived1 // test1 = false
    var test2 = base1 is Derived2 // test2 = false
    var test3 = base2 is Base // test3 = true
    var test4 = base2 is Derived1 // test4 = true
    var test5 = base2 is Derived2 // test5 = false
    var test6 = base3 is Base // test6 = true
    var test7 = base3 is Derived1 // test7 = false
    var test8 = base3 is Derived2 // test8 = true

    var test9 = derived1 is Base // test9 = true
    var test10 = derived1 is Derived1 // test10 = true
    var test11 = derived1 is Derived2 // test11 = false
    var test12 = derived2 is Base // test12 = true
    var test13 = derived2 is Derived1 // test13 = false
    var test14 = derived2 is Derived2 // test14 = true

    if (testVT && testVT3 && test && test3 && test4 && test6 && test8 && test9 && test10 && test12 && test14) {
        print("true")
    }
    if (!(testVT1 && testVT2 && test1 && test2 && test5 && test7 && test11 && test13)) {
        print("false")
    }

    return 0
}
