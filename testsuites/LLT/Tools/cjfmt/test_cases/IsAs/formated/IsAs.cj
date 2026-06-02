// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class Base {
    var name: String = "Alice"
}

class Derived1 <: Base {
    var age: UInt8 = 18
}

class Derived2 <: Base {
    var gender: String = "female"
}

main(): Int64 {
    var testVT = 1 is Int64
    testVT = 1 is String
    testVT = true is Int64
    testVT = [1, 2, 3] is List<Int64>

    let base1: Base = Base()
    var test = base1 is Base
    let castOP1 = base1 as Base
}
