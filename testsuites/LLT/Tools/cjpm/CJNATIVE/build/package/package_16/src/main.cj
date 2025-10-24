// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test

import pro1.macro_definition.*
import test.definition2.X as x

@x
var x = 1

@x
class c {}

@x
interface i {}

@x
enum e {
    e
}

main(): Unit {
    println("I'm in function body")
    let a: Int64 = @TestDef(1 + 2)
    println("a = ${a}")
    @x @x(0)
    return
}
