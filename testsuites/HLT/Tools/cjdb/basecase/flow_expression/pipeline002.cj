/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f1(x: Float16): Float16 {
    x + 1.0
}

func f2(x: Float32): Float32 {
    x + 2.0
}

func f3(x: Float64): Float64 {
    x + 3.0
}

main() {
    let a: Float16 = 1.0
    var res1 = a |> f1
    let a2: Float32 = 1.0
    var res2 = a2 |> f2
    let a3: Float64 = 1.0
    var res3 = a3 |> f3
    0
}
