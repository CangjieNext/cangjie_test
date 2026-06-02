macro package CCC

internal import std.ast.*

public macro M1(input: Tokens): Tokens {
    var decl = parseDecl(input)
    var ed = match (decl as EnumDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    return quote(enum EM1 {$(ed.constructors) | XYZZ
        func ff1(){
            return 2
        }
    })
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
