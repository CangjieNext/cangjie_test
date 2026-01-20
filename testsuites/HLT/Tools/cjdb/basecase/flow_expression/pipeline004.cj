/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f1(x: String): String {
    x
}

func f2<T>(x: T): T {
    x
}

main() {
    let a1 = 'A'
    var res1 = a1 |> f1
    let a2 = true
    var res2 = a2 |> f2
    let a3 = ()
    var res3 = a3 |> f2
    var b1 = 1
    var res_3 = b1 |> f2

    var a4 = 'A'
    var res4 = a4 |> f2<String>
    var a5 = true
    var res5 = a5 |> f2<Bool>
    var a6 = ()
    var res6 = a6 |> f2<Unit>
    var a7 = 1.0
    var res7 = a7 |> f2<Float64>
    0
}
