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

main(){
    var T1 = Tokens([
                    Token(getTokenKind(1)),
                    Token(getTokenKind(2)),
                    Token(getTokenKind(3)),
                    Token(getTokenKind(4)),
                    Token(getTokenKind(5))
                    ])
    var it = T1.iterator()
    it.next()
    var res = match (it.peek()) { // return Token(getTokenKind(1)), which is comma
        case Some(obj) => obj
        case None => Token()
    }
    var ret = match (res.kind) {
        case COMMA => "comma"
        case _ => "mismatch"
    }
    if (ret != "comma") {
        return 1
    }
    it.next()
    var res1 = match (it.peek()) { // return Token(getTokenKind(2)), which is l_paren
        case Some(obj) => obj
        case None => Token()
    }
    var ret1 = match (res1.kind) {
        case LPAREN => "l_paren"
        case _ => "mismatch"
    }
    if (ret1 != "l_paren") {
        return 2
    }
    return 0
}
