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

enum E2<T> {
    AB

    func f1<T>(a: T): T {
        a
    }
    static func f2<T>(a: T): T {
        a
    }
    static func f3(a: T): T {
        a
    }
}

main() {
    var a1 = E1.AB
    var a2 = E2<Float32>.AB
    var b1 = 1|> a1.f1
    var b2 = false |> a1.f2
    var b3 = 2 |> E1.f3
    var c1 = 1.0 |> a2.f1<Float32>
    var c2 = 1 |> E2<UInt32>.f2<UInt32>
    var c3 = 2+1 |> E2<Int64>.f3
    0
}
