/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*
import std.collection.*

main() {
    func x(a: Int64): Token {
        return Token(TokenKind.IDENTIFIER, "foo")
    }
    var len: Int64 = 100
    var tkList1: Array<Token> = Array<Token>(len, x)
    // var tkList2: Token[] = []

    var tks1 = Tokens(tkList1)
    // var tks2 = Tokens(tkList2)
    var tks3 = Tokens()

    if (tks1.size != len) {
        return 1
    }
    //   if (tks2.size != 0) {
    //        return 1
    //    }
    if (tks3.size != 0) {
        return 1
    }

    return 0
}
