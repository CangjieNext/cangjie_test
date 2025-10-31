/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum E1 {
    AB

    func f1<T>(a:T): T {
        a
    }
    func f2(a: Bool): Bool {
        true
    }
    static func f3(a: UInt32): UInt32 {
        a
    }
}


class C1{
    func f1(a: UInt32): UInt32 {
        1
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
    var a1 = C1().f3 ~> E1.AB.f2
    var a2 = C1.f2 ~> E1.AB.f1<Bool>
    var a3 = E1.f3 ~> C1().f1
    0
}
