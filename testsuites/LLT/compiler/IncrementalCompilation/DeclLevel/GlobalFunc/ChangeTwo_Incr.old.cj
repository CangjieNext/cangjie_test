func a(input:Int64):Int64{input}

func b(input:Int64):Int64{input}

func c(input:(Int64)->Int64):Int64{input(5)}

main(): Int64 {
    1 |> a
    a~>b
    1 |> (a~>b)
    a ~> b |> c
    return ((a ~> b) |> c) - 2
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
