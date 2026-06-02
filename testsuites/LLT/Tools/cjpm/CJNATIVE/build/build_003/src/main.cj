// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

@When[cc == "cc"]
internal import std.ast.*

@When[cc == "cc"]
func foo(): Unit {
    println("is foo")
}

main(): Unit {
    foo()
    return
}
