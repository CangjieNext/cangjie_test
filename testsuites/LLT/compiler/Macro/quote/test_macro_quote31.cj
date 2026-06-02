// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_macro %noColor %f
// ASSERT: scan unknown start of token: \

macro package define

internal import std.ast.*


public macro test(input:Tokens):Tokens{
    var x1 = quote(\()
    var x2 = quote(\$)
    var x3 = quote(\[)
    var x4 = quote(\])
    var x5 = quote(\\)
    var x6 = quote(\x)
    return quote(\))
}

