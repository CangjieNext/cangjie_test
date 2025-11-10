// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %cmp_macro legal_input.cj
macro package define

import stdx.syntax.*
import stdx.syntax

public late macro LateM(input: Decl): Decl {
    println("LateM")
    return input
}

public late macro LateM1(input: syntax.Decl): syntax.Decl {
    println("LateM with syntax.Decl input")
    return input
}

public late macro LateM2(input: Expr): Expr {
    println("LateM with Expr input")
    return input
}

public late macro LateM3(input: syntax.Expr): syntax.Expr {
    println("LateM with syntax.Expr input")
    return input
}