// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package p1

internal import std.ast.*

func helper(input: Tokens) {
    return input
}

public macro M1(input: Tokens) {
    println("M1 at compile time")
    return helper(input)
}

public macro N1(input: Tokens) {
    println("N1 at compile time")
    return helper(input)
}
