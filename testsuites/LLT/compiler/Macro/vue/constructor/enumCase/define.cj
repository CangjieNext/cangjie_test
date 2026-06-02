// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package view

internal import std.ast.*

public macro M(input: Tokens) {
    input
}

public macro M(attr: Tokens, input: Tokens) {
    input
}

public macro HourWithAgrs(input: Tokens) {
    return quote(Hour(Int64))
}

public macro MonthWithAgrs(input: Tokens) {
    return quote(Month(String))
}

public macro MonthFuncDecl(input: Tokens) {
    return quote(func Month(a : Int64){1})
}

public macro MonthGeneric(input: Tokens) {
    return quote(Month(T))
}

public macro MonthAndDay(input: Tokens) {
    return quote(Month | Day)
}

public macro AA1(input: Tokens) {
    quote(func gggsss(){})
}

public macro AA2(input: Tokens) {
    quote(gggsss(a))
}

public macro AA3(attr: Tokens, input: Tokens) {
    quote($attr;$input)
}
