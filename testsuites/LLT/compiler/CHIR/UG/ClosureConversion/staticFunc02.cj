// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

extend CPointer<Bool> {
    static func foo(x: Int32) {}
    static func goo(x: Int32) {
        func hoo<X>(y: X) where X <: ToString {
            foo(1)
            println(y)
            1
        }
        var z = hoo<Bool>
        z(true)
    }
}

class A<T1, T2> {}

extend<U1, U2> A<U2, U1> {
    static func foo(x: U1) {}
    static func goo(x: U1, y: U2) {
        func hoo<X>(y: X) where X <: ToString {
            foo(x)
            println(y)
        }
        var z = hoo<Bool>
        z(true)
    }
}

class B<T1, T2> {}

extend<U1> B<Bool, U1> {
    static func foo(x: U1) {}
    static func goo(x: U1) {
        func hoo<X>(y: X) where X <: ToString {
            foo(x)
            println(y)
        }
        var z = hoo<Bool>
        z(true)
    }
}

main() {
    var a = A<Bool, Int32>.foo
    var b = B<Bool, Int64>.foo
    var c = CPointer<Bool>.goo
}
