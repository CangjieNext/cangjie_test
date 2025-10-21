/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C1<T> {
    func f1(a: T): Float32 {
        1.0
    }
    static func f2(a: T): Bool {
        true
    }       
    func f3<T>(a: T) {
        a
    }
    func f4(b: Int64): Int64 {
        1
    }
}

struct S1<T> {
    func f1(a: T): Float32 {
        1.0
    }
    static func f2(a: T): Bool {
        true
    }       
    func f3<T>(a: T) {
        a
    }
    func f4(b: Int64): Int64 {
        1
    }
}

main() {
    var a1 = C1<Int64>()
    var a2 = S1<Int64>()
    var b1 = 1 |> a1.f1 |> C1.f2
    var b2 = Float32(1.0) |> C1.f2
    var b_1 = 1 |> a2.f1 |> S1.f2
    var b_2 = Float32(1.0) |> S1.f2
    0
}
