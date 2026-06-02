/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package test

@C
import std.ast.*

@C
public macro M(a:Tokens):Tokens{
    var x = sourceFile()
    var y = sourceLine()
    return a
}
