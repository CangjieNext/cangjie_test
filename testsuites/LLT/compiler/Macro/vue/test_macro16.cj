// ERRCHECK: %compiler %cmp_macro %noColor %f

macro package view

internal import std.ast.*

public macro callView(input: Tokens): Tokens {
    input
}

var a = callView

func aaa() {
    var b = callView
}

/* SCAN-IN
error: undeclared identifier 'callView'
  ==> test_macro16.cj:11:9:
   | 
11 | var a = callView
   |         ^ 
   | 

error: undeclared identifier 'callView'
  ==> test_macro16.cj:14:13:
   | 
14 |     var b = callView
   |             ^ 
   | 

2 errors generated, 2 errors printed.
 */
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

