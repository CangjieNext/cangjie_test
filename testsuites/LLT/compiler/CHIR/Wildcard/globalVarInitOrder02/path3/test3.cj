// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func foo5(): Int64 {
    println("foo5")
    0
}

func foo6(): Int64 {
    println("foo6")
    0
}

let (_, _) = (foo5(), foo6())