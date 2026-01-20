/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f1(x: Rune): Rune {
    x
}

func f2(x: Bool): Bool {
    x
}

func f3(x: Unit): Unit {
    println("gg")
}

main() {
    let a1 = r'A'
    var res1 = a1 |> f1
    let a2 = true
    var res2 = a2 |> f2
    let a3 = ()
    var res3 = a3 |> f3
    0
}
