// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import std.ast.*

const RECEIVER_MARKER_NAME = "ReceiverFoo"
let receiverMarkerToken = Token(IDENTIFIER, RECEIVER_MARKER_NAME)

public macro Receiver(input: Tokens): Tokens {
    let decl = parseDecl(input)
    let tks = quote(
        @$receiverMarkerToken
        
    ) + decl.toTokens()
    let mDecl = (parseDecl(tks) as MacroExpandDecl).getOrThrow()
    let inputs = parseDecl(mDecl.macroInputs)
    inputs.toTokens()
}
