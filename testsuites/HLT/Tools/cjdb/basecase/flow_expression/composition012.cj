/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum E1 {
    AB
}

class C1 {}

extend C1{
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

extend E1{
    func f1<T>(a:T){
        a
    }
    func f2(b: Bool) {
        b
    }
    static func f3(a: UInt32): UInt32 {
        a
    }
}

main() {
    var a1 = C1().f1 ~> C1.f2
    var a2 = C1().f3 ~> C1().f3
    var a3 = C1().f4<Bool> ~> C1().f3
    var a4 = E1.AB.f1<UInt32> ~> E1.f3
    var a5 = E1.AB.f2 ~> E1.AB.f1<Bool>
    0
}
