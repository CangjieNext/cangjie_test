macro package defne
internal import std.ast.*

public macro A(input:Tokens){
    quote(1)
}

public macro X(attr:Tokens, input:Tokens){
    quote(3)
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
