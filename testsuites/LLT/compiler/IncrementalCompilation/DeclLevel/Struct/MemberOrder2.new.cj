main(): Unit {}

class A {
    static prop p: Int32 {
        get() {2}
    }
    mut prop r: Int32 {
        get() {1}
        set(v) {}
    }
    static func bar(): Int64 { 2 }
    static var b: ?Int32 = Some(1)
    ~init() {}
    init() {}
    func foo(): Int32 { 1 }
    let a: Int64 = 3
}

abstract class B {
    public func foo(): Int32 
    let a: Int32 = 2
}

struct C {
    static prop p: Int32 {
        get() {2}
    }
    mut prop r: Int32 {
        set(m) {}
        get() {1}
    }
    static func bar(): Int64 { 2 }
    static var b: ?Int32 = Some(1)
    C() {}
    func foo(): Int32 { 1 }
    let a: Int64 = 3
}

interface D {
    prop vat: Int32 {
        get() { foo() }
    }
    func bar(): Int32 { 1 }
    func foo(): Int32 
}

enum E {
    R|K 
    prop vat: Int64 {
        get() { 1 }
    }
    func foo(): Int32 {2}
}

extend C {
    mut prop m1: Int64 {
        set(v) {}
        get() {1}
    }
    prop gro: Int64 {
        get() { 1 }
    }
    func meet(): Int32 { 1 }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
