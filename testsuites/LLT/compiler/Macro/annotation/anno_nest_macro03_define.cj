// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package anno_nest_macro03_define

import std.ast.*
import anno_nest_macro03_helper.*

public macro Pointcut(input: Tokens): Tokens {
    func transform(decl: Decl): Tokens {
        match (decl) {
            case classDecl: ClassDecl => classDecl.toTokens()
            case macroDecl: MacroExpandDecl =>
                var inner = macroDecl
                while (let nested: MacroExpandDecl <- inner.macroInputDecl) {
                    inner = nested
                }
                inner.macroInputDecl = parseDecl(transform(inner.macroInputDecl))
                macroDecl.toTokens()
            case other => other.toTokens()
        }
    }
    transform(parseDecl(input))
}
