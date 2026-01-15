/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:../utils.cj
// EXEC: %compiler %cmp_opt %f utils.cj %use_ast -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan IllegalArgumentException:
// ASSERT: scan unknown start of token: \

import std.ast.*

main(){
    var i = """
    spawn \\{}"""
    var a : Tokens = cangjieLex(i)
    var b : Tokens = Tokens().append(Token(TokenKind.SPAWN, "spawn")).append(Token(TokenKind.ILLEGAL, "\\")).append(Token(TokenKind.LCURL, "{")).append(Token(TokenKind.RCURL, "}"))
    return check(a, b)
}

