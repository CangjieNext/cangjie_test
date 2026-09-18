// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package refresh_local_named_param_macro

internal import std.ast.*

public macro Pass(input: Tokens): Tokens {
    parseDecl(input).toTokens()
}
