// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import stdx.syntax.*
import stdx.syntax
import std.ast

public late macro LateM0(input: Decl): Expr {
    println("LateM with different input and output types")
    return input
}

public late macro LateM(input: Expr): Decl {
    println("LateM with different input and output types")
    return input
}

public late macro LateM1(input: Expr): Expr {
    println("LateM with different actual return type and input type")
    return quote($input)
}