// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f

internal import std.ast.*

main(): Unit {
    var toke: Tokens = Token(TokenKind.NONE) + Token(TokenKind.ADD)
    0
}

/* SCAN-IN
error: 'NONE' is not a member of enum 'TokenKind'
 ==> test_002.cj:6:40:
  | 
6 |     var toke: Tokens = Token(TokenKind.NONE) + Token(TokenKind.ADD)
  |                                        ^^^^ 
  | 

1 error generated, 1 error printed.
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
