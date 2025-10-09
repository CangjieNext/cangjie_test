// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package macro_definition

internal import std.ast.*

public macro M(attr:Tokens,input:Tokens):Tokens{
    for (i in 10..-1) {
        if (i > 0) {
            continue
        }
        return quote($i)
    }
    return quote(11)
}