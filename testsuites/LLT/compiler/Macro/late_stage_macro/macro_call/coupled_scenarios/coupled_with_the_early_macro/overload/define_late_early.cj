// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define_late_early

import stdx.syntax.*
import stdx.syntax
import std.ast.Tokens

public late macro LateM(input: Decl): Decl {
    return input
}

public macro LateM(input: Tokens): Tokens {
    return input
}