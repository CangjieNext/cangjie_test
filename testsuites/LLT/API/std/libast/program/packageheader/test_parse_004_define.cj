macro package def

import std.ast.*

public macro package1(input: Tokens) {
    var inputTks = quote(package a)
    var program = parseProgram(inputTks)
    var packageHeader = program.packageHeader
    println(packageHeader.toTokens())
    input
}

public macro package2(input: Tokens) {
    var inputTks = quote(package a.b)
    var program = parseProgram(inputTks)
    var packageHeader = program.packageHeader
    println(packageHeader.toTokens())
    input
}

public macro package5(input: Tokens) {
    var inputTks = quote(package a.b.c.d.e)
    var program = parseProgram(inputTks)
    var packageHeader = program.packageHeader
    println(packageHeader.toTokens())
    input
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
