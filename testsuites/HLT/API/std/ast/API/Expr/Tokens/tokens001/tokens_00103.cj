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
    var i: Int64 = 100
    var myArray: Array<Token> = Array<Token>(i, x)
    var tks = Tokens(myArray)
    if (tks.size != 100) {
        return 1
    }
    if (tks.get(9).value != "foo") {
        return 2
    }
    return 0
}
