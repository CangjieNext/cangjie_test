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
// ASSERT: scan expected decimal digit, found ' '

import std.ast.*

main(){
    var i = "-0xFP + 1"
    var a : Tokens = cangjieLex(i)
    var b : Tokens = Tokens().append(Token(TokenKind.SUB, "-")).append(Token(TokenKind.FLOAT_LITERAL, "0xFP")).append(Token(TokenKind.ADD, "+")).append(Token(TokenKind.INTEGER_LITERAL, "1"))
    return check(a, b)
}
