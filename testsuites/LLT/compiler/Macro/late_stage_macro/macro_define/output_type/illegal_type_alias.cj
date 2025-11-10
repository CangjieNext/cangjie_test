// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import stdx.syntax.*
import stdx.syntax

type NewDecl = syntax.ClassDecl
type NewTokens = Tokens

public late macro LateM(input: Expr): NewTokens {
    println("LateM")
    return input
}

public late macro LateM1(input: NewDecl): NewDecl {
    println("LateM with NewDecl output")
    return input
}