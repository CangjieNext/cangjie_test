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
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan IllegalArgumentException:
// ASSERT: scan cannot start a(n) integer literal with a '0' digit

import std.ast.*

main(){
    var i = "00o0"
    var a : Tokens = cangjieLex(i)
    var b : Tokens = Tokens().append(Token(TokenKind.INTEGER_LITERAL, "00o")).append(Token(TokenKind.INTEGER_LITERAL, "0"))
    return check(a, b)
}
