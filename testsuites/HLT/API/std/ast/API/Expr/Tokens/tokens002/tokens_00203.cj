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
    var tkList = [Token(), Token(TokenKind.IDENTIFIER, "foo"), Token(TokenKind.DOT)]
    var tks = Tokens(tkList)
    if (tks.get(0).value != "") {
        return 1
    }
    if (tks.get(1).value != "foo") {
        return 2
    }
    if (tks.get(2).value != ".") {
        return 3
    }
    if (tks[0].value != "") {
        return 4
    }
    if (tks[1].value != "foo") {
        return 5
    }
    if (tks[2].value != ".") {
        return 6
    }
    return 0
}
