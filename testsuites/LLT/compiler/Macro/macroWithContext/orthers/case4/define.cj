// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package mcr

internal import std.ast.*
internal import std.collection.ArrayList

public macro inner(input: Tokens) {
    assertParentContext("outer")
    setItem("key", "inner message!")
    return input
}

public macro outer(input: Tokens) {
    let messages: ArrayList<MacroMessage>
    println("${messages = getChildMessages("inner")}")
    println(messages.size)
    return input
}
