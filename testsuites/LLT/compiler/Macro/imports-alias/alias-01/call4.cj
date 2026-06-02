// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../define1.cj
// EXEC: %compiler define1.cj %cmp_macro
// EXEC: %compiler %cmp_opt %cmp_macro %f

macro package pkg

import p1.M1 as Moo
import std.ast.*

public macro Moo(input: Tokens) {
    input
}
