// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output %run_args

package pkg

class C {}

class A<T, U> where T <: C {
    public var a: T
    public var d: U
    public init(b: T, c: U) {
        this.a = b
        this.d = c
    }
    static func test(a: T, b: U) {}
}

type D = C

type B<T> = A<T, A<T, C>>

main() {
    let b1 = B(C(), A(C(), C()))
    let c1 = B.test(C(), A(C(), C()))
}
