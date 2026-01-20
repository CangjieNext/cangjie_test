/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C1{
    func f1(a: Int64): Float32 {
        1.0
    }
    static func f2(a: Float32): Bool {
        true
    }
    func f3(b: Bool) {
        b
    }
    func f4<T>(a:T){
        a
    }
}

struct S1 {
    func f1(a: Int64): Float32 {
        1.0
    }
    static func f2(a: Float32): Bool {
        true
    }
    func f3(b: Bool) {
        b
    }
    func f4<T>(a:T){
        a
    }
}

main() {
    var a1 = C1()
    var a2 = S1()
    var b1 = a1.f1 ~> C1.f2
    var b2 = C1.f2 ~> a1.f3
    var b3 = a1.f3 ~> a1.f4<Bool>
    var c1 = a2.f1 ~> S1.f2
    var c2 = S1.f2 ~> a2.f3
    var c3 = a2.f3 ~> a2.f4<Bool>
    0
}
