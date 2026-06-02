/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args
import std.ast.*
main() {
    var T1: Tokens = Tokens(Array<Token>(5, repeat: Token(TokenKind.DOT)))
    var T2: Token = Token(TokenKind.COMMA)
    var res1 = T1 + T2 // 000001
    var res2 = T2 + T1 // 100000
    if (res1.size != 6 || res2.size != 6) {
        return 1
    }
    var t1 = res1.get(5) // 1
    var t2 = res2.get(5) // 0
    var k1 = (t1 == Token(TokenKind.COMMA).addPosition(1, 15, 21))
    var k2 = (t2 == Token(TokenKind.DOT).addPosition(1, 14, 53))
    if (!k1 || !k2) {
        return 2
    }
    return 0
}

