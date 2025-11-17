/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package pkg2

import std.ast.*
import pkg1.*

public macro Prop(input: Tokens): Tokens {
    let v = parseVarDecl(input)
    @GetIdent[ident](v)
    return quote(
        $(input)
        public prop $(ident): $(v.getType().getOrThrow()) {
            get() {
                this.$(v.getIdentifier())
            }
        }
    )      
}
