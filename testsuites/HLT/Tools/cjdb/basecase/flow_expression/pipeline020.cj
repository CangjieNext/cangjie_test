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

extend C1<UInt8>{
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

extend E1<Rune>{
    func f1<T>(a:T): T {
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
    var a1 = C1<UInt8>()
    var a2 = E1<Rune>.AB
    var b1 = 1 |> a1.f1
    var b2 = Float32(2) |> C1.f2
    var b3 = true |> a1.f3
    var b4 = (1, 2) |> a1.f4
    var b5 = [("1","a"),("2","b")] |> a1.f4
    var c1 = 1.0 |> a2.f1<Float64>
    var c2 = false |> a2.f2
    var c3 = 2 |> E1<Rune>.f3
    0
}
