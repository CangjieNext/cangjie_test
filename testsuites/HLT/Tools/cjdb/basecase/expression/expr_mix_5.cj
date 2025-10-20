/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



import std.collection.*

struct rect {
    let array01: Array<Int64> = [1, 2, 3, 4, 5]
    var array02: Array<Array<Int64>> = [array01]
    let width: Int64 = 10
    var height: Int32 = 32
}

class classA {
    var A0: Int8 = 10
    var stvar01 = rect()
    func testclassA(): Int64 {
        var testclassBvar: Int64 = 20
        return 10
    }
}

class classB {
    var A: Int8 = 10
    var clA = classA()
    func testclassA() {
        var testclassBvar: Int64 = 20
    }
}

class classC {
    var clB = classB()
    var B: Int8 = 10
    var c: UInt8 = 5
    func testclassC() {
        var testclassCvar: Int32 = 20
    }
}

main(): Int64 {
    var cc = classC()
    return 0
}
