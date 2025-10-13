struct A {
    var a: Int64 = 0
}
extend A <: ToString {
    public func toString(): String {
        var a = A()
        a.a = this.a + 10
        return a.a.toString()
    }
}
main(): Int64 {
    var a = A()
    a.a = 3
    return a.toString().size
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
