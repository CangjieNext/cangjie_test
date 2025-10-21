/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

type A1 = Int32

type A2 = Float16

func f(x: A1): A1 {
    x + 1
}

func f2<T>(x: T): T {
    x
}

let a: A1 = 1
let a2: A2 = 2.0
var res1 = a |> {x: A1 => x + 1}
var res2 = a |> f
var res3 = a2 |> f2
var res4 = a2 |> f2<A2>

main() {
    let a: A1 = 1
    let a2: A2 = 2.0
    var res1 = a |> {x: A1 => x + 1}
    var res2 = a |> f
    var res3 = a2 |> f2
    var res4 = a2 |> f2<A2>
    0
}
