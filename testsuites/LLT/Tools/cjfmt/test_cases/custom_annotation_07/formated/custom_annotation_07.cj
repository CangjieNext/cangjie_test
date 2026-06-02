// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

internal import std.ast.*

public macro M(input: Tokens) {
    quote($(parseDecl(input)))
}

public macro M0(input: Tokens) {
    input
}

public macro Me(input: Tokens) {
    quote($(parseExpr(input)))
}

public macro M1(input: Tokens) {
    quote($(parseDecl(input)))
}

public macro M2(input: Tokens) {
    quote($(parseDecl(input)))
}

public macro M3(input: Tokens) {
    quote($(parseDecl(input)))
}

public macro M4(input: Tokens) {
    quote($(parseDecl(input)))
}

public macro M5(input: Tokens) {
    quote($(parseDecl(input)))
}

public macro M6(input: Tokens) {
    quote($(parseDecl(input)))
}

public macro M7(input: Tokens) {
    quote($(parseDecl(input)))
}

public macro M8(input: Tokens) {
    quote($(parseDecl(input)))
}

public macro MtoClass(input: Tokens) {
    quote(class C {})
}

public macro MtoStruct(input: Tokens) {
    quote(struct C {})
}

public macro MtoStruct2(input: Tokens) {
    quote(
    @Annotation
    struct C {})
}
