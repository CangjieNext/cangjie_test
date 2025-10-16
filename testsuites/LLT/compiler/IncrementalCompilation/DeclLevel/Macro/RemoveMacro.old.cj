macro package define

import std.ast.*

class A{
    public var a : Tokens = quote(0)
}

public macro M(attr:Tokens,input:Tokens):Tokens{
    return A().a
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
