// EXEC-PIPE-1: %compiler %cmp_macro %noColor %f 2>&1 | compare %f

macro package view

internal import std.ast.*

public macro X(attr: Tokens, input: Tokens) {
    var c = X
    return attr
}

public macro Y(input: Tokens) {
    var c = Y
    return input
}

func test() {
    let a: Tokens = Tokens()
    let b: Tokens = Tokens()
    X(a, b)
    Y(a)
    var c = X
    var d = Y
    0
}

/* SCAN-IN
error: undeclared identifier 'X'
 ==> test_macro11.cj:8:13:
  | 
8 |     var c = X
  |             ^ 
  | 

error: undeclared identifier 'Y'
  ==> test_macro11.cj:13:13:
   | 
13 |     var c = Y
   |             ^ 
   | 

error: undeclared identifier 'X'
  ==> test_macro11.cj:20:5:
   | 
20 |     X(a, b)
   |     ^ 
   | 

error: undeclared identifier 'Y'
  ==> test_macro11.cj:21:5:
   | 
21 |     Y(a)
   |     ^ 
   | 

error: undeclared identifier 'X'
  ==> test_macro11.cj:22:13:
   | 
22 |     var c = X
   |             ^ 
   | 

error: undeclared identifier 'Y'
  ==> test_macro11.cj:23:13:
   | 
23 |     var d = Y
   |             ^ 
   | 

6 errors generated, 6 errors printed.
 */
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

