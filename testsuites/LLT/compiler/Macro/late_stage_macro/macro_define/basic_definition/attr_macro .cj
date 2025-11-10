// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %cmp_macro %f -o %output

macro package define

import stdx.syntax.*

public late macro LateM(input: Decl): Decl {
    println("LateM")
    return input
}

public late macro LateMWithAttr(attrs: Tokens, input: Decl): Decl {
    println("LateM with attrs")
    return input
}