// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: return_one.cj %f.expect
// EXEC: %compiler %cmp_opt return_one.cj %cmp_macro
// EXEC: %compiler %cmp_opt %cmp_opt %f %cmp_macro --debug-macro
// EXEC: %diff %f.macrocall %f.expect

macro package define

internal import return_one.*
internal import std.ast.*

public macro M(input: Tokens) {
    @VAR_A(1)
    return quote($(1))
}
