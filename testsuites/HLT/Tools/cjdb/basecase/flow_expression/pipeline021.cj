/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f(a!: Int64): Int64 {
    return a
}

func f2(a:Int64, b!: Int64 = 2): Int64 {
    b
}

main() {
    var x = 1 |> {x:Int64 => f(a:x)}
    var a = 1|> f2
    var a2 = 1 |> {x:Int64 => f2(x, b:3)}
    0
}
