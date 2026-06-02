// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I<T1> {
    static func foo<T2>() {}
    static func goo(x: T1) {
        0
    }
}

extend CPointer<Bool> <: I<Int32> {
    public static func goo(x: Int32) {
        1
    }
}

class A<T1, T2> {}

extend<U1, U2> A<U2, U1> {
    static func foo(x: U1, y: U2) {
        println(1)
    }
}

class B<T1, T2> {}

extend<U1> B<Bool, U1> {
    static func foo(x: U1) {
        println(1)
    }
}

main() {
    var a = A<Bool, Int32>.foo
    var b = B<Bool, Int64>.foo
    var c = CPointer<Bool>.goo
}
