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

    func f(a:Int64, b!: Int64 = 2): Int64 {
        b
    }

    func f2(a:Int64, b!: Int64 = 2): Int64 {
        b
    }
}

var b1 = C1()
var x = 1 |> {x:Int64 => b1.f(a:x)}
var a = 1|> b1.f
var a2 = 1 |> {x:Int64 => b1.f2(x, b:3)}

main() {
    var x = 1 |> {x:Int64 => b1.f(a:x)}
    var a = 1|> b1.f
    var a2 = 1 |> {x:Int64 => b1.f2(x, b:3)}
    var b = b1.f(1)
    0
}
