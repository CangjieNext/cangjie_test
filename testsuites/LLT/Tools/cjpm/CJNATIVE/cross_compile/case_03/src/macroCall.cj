// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package b

internal import b.aoo.*
internal import b.macro_definition.*

main(): Int64 {
    println(one)
    println("I'm in function body")
    let a: Int64 = @TestDef(1 + 2)
    println("a = ${a}")
    return 0
}
