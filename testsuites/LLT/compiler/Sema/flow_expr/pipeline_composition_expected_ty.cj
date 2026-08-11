// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output

func f(x: Int64): Int64 {
    x
}

func g(x: Int64): Int8 {
    Int8(x + 1)
}

main(): Int64 {
    let r: Int8 = 10 |> (f ~> g)
    0
}