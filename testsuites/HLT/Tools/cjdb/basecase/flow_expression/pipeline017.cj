/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I1 {
    func f1(a: Int64): Float32
    func f2(a: Bool): Bool {
        true
    }
}

class C1 <: I1 {
    public func f1(a: Int64): Float32 {
        1.0
    }  
}

interface I2<T> {
    func f1(a: T): T
    func f2(a: T): T {
        a
    }
}

struct S1<T> <: I2<T> {
    public func f1(a: T): T {
        a
    }
}

main() {
    var a1 = C1()
    var a2 = S1<String>()
    var a3 = S1<C1>()
    var b1 = 1 |> a1.f1
    var b2 = false |> a1.f2
    var b3 = "aaa" |> a2.f1
    var b4 = """
    as
    vv
""" |> a2.f2
    var b5 = C1() |> a3.f1
    var b6 = C1() |> a3.f2
    0
}
