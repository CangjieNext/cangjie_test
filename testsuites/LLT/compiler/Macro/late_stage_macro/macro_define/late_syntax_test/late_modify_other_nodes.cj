// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import stdx.syntax.*
import stdx.syntax

late type NewDecl = syntax.ClassDecl
type NewTokens = Tokens

public late func lateFunc(input: Expr): NewTokens {
    println("LateFunc")
    return input
}