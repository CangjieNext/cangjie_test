// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package testing.mpackage

internal import std.ast.*
internal import std.env.*
internal import std.process.*

public macro PrintEnvVar(input:Tokens):Tokens{

    let value1 = getVariable("VAR_A") ?? throw Exception("Novar")
    let value2 = getVariable("var_b") ?? throw Exception("Novar")
    let value3 = getVariable("Var_c") ?? throw Exception("Novar")
    let res = "${value1} ${value2} ${value3}"
    return quote(
        println($res)
        $input
    )
}