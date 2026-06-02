/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f1(a: Int64): Float32 {
    1.0
}

func f2(a: Float32) : Bool {
    true
}

func h(b: Bool) {
    b
}

func f3<T>(a: T) {
    a
}

main() {
    var b1 = 1+1 |> {x: Int64 => x + 1}
    var b3 = 1.0+2.0 |> {x: Float64 => x + 1.0}
    var b4 = true |> {x: Bool => x}
    var b5 = r'\t' |> {x: Rune => x}
    var b6 = [1,2] |> {x: Array<Int64> => x}
    var res3 = 1<0 || 1>10 |> h
    var a1 = 1 |> f1 |> f2
    var a2 = Float32(1.0) |> f2 |> h
    var a3 = 1 |> f3 |> f3 |> f3
    0
}
