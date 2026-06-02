// EXEC-PIPE-1: %compiler  %noColor %f 2>&1 | compare %f

macro package view

internal import std.ast.*

macro callView(input: Tokens) : Tokens {
    let token = cangjieLex("var c:Int64 = 3")
    token.dump()
    return input
}

/* SCAN
error: macro declaration must be modified with 'public'
 ==> test_macro4.cj:7:1:
  | 
7 | macro callView(input: Tokens) : Tokens {
  | ^^^^^ expected 'public' before here
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

