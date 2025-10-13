// LEVEL: 0
// EXEC: %compiler --disable-inst %f -o %output || true
// ASSERT: scan disable instantiation, CHIR2 translation done.

var x = 1

interface I {
    static func foo(): Unit
}

class A<T> {
    var a = 1
}

open class B <: I {
    var b = 1
    static public func foo() {
        x = 3
    }
}

class C <: B {
    var c = 1
    static public func foo() {
        x = 4
    }
}

extend<T> A<T> where T <: B {
    public func foo() {
        T.foo() // 泛型的时候翻译错了，应该用invoke，实际用的apply，调用的B.foo()
    }
}

main() {
    var m = A<C>()
    m.foo()
    return x - 4
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
