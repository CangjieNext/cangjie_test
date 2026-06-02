// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC-9: %run %run_opt %n.%suffix

class CA<T> {
    var x: T
    init(_x: T) {
        x = _x
    }
}

interface I1 {
    func foo(): Int64 {
        1
    }
}

interface I2 {}

extend<T> CA<T> <: I1 where T <: I2 {
    public func foo(): Int64 {
        8
    }
}

extend Int64 <: I2 {}

extend Int64 <: I1 {}

main() {
    var i64: Int64 = 5
    i64.foo() + CA<Int64>(1).foo()
}
