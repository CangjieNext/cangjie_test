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

main() {
    var tk1 = Token(TokenKind.IDENTIFIER, "`a`")
    var tk2 = Token(TokenKind.INTEGER_LITERAL, "345")
    var tk3 = Token(TokenKind.FLOAT_LITERAL, "3.43536")
    var tk4 = Token(TokenKind.RUNE_LITERAL, "'a'")
    var tk5 = Token(TokenKind.STRING_LITERAL, "\"hello\"")
    var tk6 = Token(TokenKind.MULTILINE_STRING, "\"\"\"\n hello world!\"\"\"")
    var tk7 = Token(TokenKind.BOOL_LITERAL, "true")
    var tk8 = Token(TokenKind.IDENTIFIER, "1_one")
    if (tk1.kind != TokenKind.IDENTIFIER) {
        return 1
    }
    if (tk1.value != "`a`") {
        return 2
    }
    if (tk2.value != "345") {
        return 3
    }
    if (tk3.value != "3.43536") {
        return 3
    }
    if (tk4.value != "'a'") {
        return 3
    }
    if (tk5.value != "\"hello\"") {
        return 3
    }
    if (tk6.value != "\"\"\"\n hello world!\"\"\"") {
        return 3
    }
    if (tk7.value != "true") {
        return 3
    }
    if (tk8.value != "1_one") {
        return 3
    }
    return 0
}
