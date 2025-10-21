/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C1 {
    func f(a!: Int64): Int64 {
        a
    }
    
    func f(a: Int64, b!: Int64 = 2): Int64 {
        b
    }

    static func f2(a: Int64, b!: Int64 = 2): Int64 {
        b
    }
}

type A1 = C1

type A2 = A1

var b1 = A1()
var x = 1 |> {x: Int64 => A2().f(a: x)}
var a = 1 |> A2().f
var a2 = 1 |> {x: Int64 => A2.f2(x, b: 3)}

main() {
    var x = 1 |> {x: Int64 => A2().f(a: x)}
    var a = 1 |> A1().f |> {x: Int64 => A2().f(a: x)}
    var a2 = 1 |> {x: Int64 => A2.f2(x, b: 3)}
    0
}
