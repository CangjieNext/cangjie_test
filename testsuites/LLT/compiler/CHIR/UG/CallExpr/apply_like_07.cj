// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I<T> {}
extend Bool <: I<Bool> {}
interface I2 {
    static func goo() {
        println("I2::goo")
    }
}

class A<T1, T2> {

}

extend<T1, T2> A<T1, T2> <: I2 where T1 <: I<T2> {
}

extend<T1, T2> A<T1, T2> where T1 <: I<T2> {
    static func foo() {
        goo()
    }
}

main() {
    A<Bool, Bool>.foo()
}