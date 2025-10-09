// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func f(x: Int32): Int32 { x + 1 }
func h(b: Bool) { b }
func g<T>(x: T): T { x }

main():Int64 {
    let a: Int32 = 1
    var res = a |> f
    var res1 = a |> {x: Int32 => x + 1}
    let res3 = a < 0 || a > 10  |> h
    var res4 = a |> g<Int32>
    0
}