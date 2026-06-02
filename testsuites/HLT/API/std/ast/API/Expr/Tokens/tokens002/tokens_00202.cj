/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan OutOfMemory, exit with 0

import std.ast.*
import std.collection.*

main() {
    func x(a: Int64): Token {
        return Token(TokenKind.IDENTIFIER, "foo")
    }
    var len: Int64 = 9223372036854775807
    try {
        var tkList1: ArrayList<Token> = ArrayList<Token>(len, x)
        var tks1 = Tokens(tkList1)
        if (tks1.size != len) {
            return 1
        }
        return 0
    } catch (e: OutOfMemoryError) {
        print("OutOfMemory, exit with 0")
        return 0
    }
}
