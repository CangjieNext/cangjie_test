/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum E1<T> {
    AB
}

class C1<T> {}

extend C1<UInt8> {
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

extend E1<Rune> {
    func f1<T>(a: T): T{
        a
    }
    func f2(b: Bool): Bool {
        true
    }
    static func f3(a: UInt32): UInt32 {
        a
    }
}

main() {
    var a1 = C1<UInt8>().f1 ~> C1<UInt8>.f2
    var a2 = C1<UInt8>().f3 ~> C1<UInt8>().f4<Bool>
    var a3 = E1<Rune>.AB.f1<Bool> ~> E1<Rune>.AB.f2
    var a4 = E1<Rune>.AB.f1<UInt32> ~> E1<Rune>.f3
    0
}
