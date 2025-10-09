/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package pkg1

import std.ast.*

public macro GetIdent(attr: Tokens, input: Tokens): Tokens {
    return quote(
        let size = $(input).getIdentifier().value.size
        let name = $(input).getIdentifier().value[0..size - 1]
        let $(attr) = Token(TokenKind.IDENTIFIER, name)
    )
}
