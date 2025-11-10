// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import stdx.syntax.*
import stdx.syntax

public late macro LateM(input: Decl): Decl {
    println("LateM")
    return input
}

public late macro LateM1(input: syntax.Decl): syntax.Decl {
    println("LateM with syntax.Decl output")
    return input
}

public late macro LateM2(input: Expr): Expr {
    println("LateM with Expr output")
    return input
}

public late macro LateM3(input: syntax.Expr): syntax.Expr {
    println("LateM with syntax.Expr output")
    return input
}