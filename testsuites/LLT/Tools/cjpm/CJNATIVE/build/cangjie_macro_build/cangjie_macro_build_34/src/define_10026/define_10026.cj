// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package b.define_10026

internal import std.ast.*

public macro Y(input: Tokens) {
    return quote(1+1)
}

public macro X(input: Tokens) {
    return quote(var x : Int64)
}

public macro YY(input: Tokens) {
    return quote(1+1)
}

public macro XX(input: Tokens) {
    return quote(var x : Int64)
}

public macro YYY(input: Tokens) {
    return quote(1+1)
}

public macro XXX(input: Tokens) {
    return quote(var x : Int64)
}

public macro XXXX(attr: Tokens, input: Tokens) {
    return attr + quote(-) + input
}

public macro YYYY(attr: Tokens, input: Tokens) {
    return attr + quote(+) + input
}
