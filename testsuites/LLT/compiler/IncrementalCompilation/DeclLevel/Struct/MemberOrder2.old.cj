main(): Unit {}

class A {
    let a: Int64 = 3
    func foo(): Int32 { 1 }
    init() {}
    ~init() {}
    static var b: ?Int32 = Some(1)
    static func bar(): Int64 { 2 }
    mut prop r: Int32 {
        get() {1}
        set(v) {}
    }
    static prop p: Int32 {
        get() {2}
    }
}

abstract class B {
    let a: Int32 = 2
    public func foo(): Int32
}

struct C {
    let a: Int64 = 3
    func foo(): Int32 { 1 }
    C() {}
    static var b: ?Int32 = Some(1)
    static func bar(): Int64 { 2 }
    mut prop r: Int32 {
        get() {1}
        set(m) {}
    }
    static prop p: Int32 {
        get() {2}
    }
}

interface D {
    func foo(): Int32 
    func bar(): Int32 { 1 }
    prop vat: Int32 {
        get() { foo() }
    }
}

enum E {
    R|K 
    func foo(): Int32 {2}
    prop vat: Int64 {
        get() { 1 }
    }
}

extend C {
    func meet(): Int32 { 1 }
    prop gro: Int64 {
        get() { 1 }
    }
    mut prop m1: Int64 {
        get() {1}
        set(v) {}
    }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
