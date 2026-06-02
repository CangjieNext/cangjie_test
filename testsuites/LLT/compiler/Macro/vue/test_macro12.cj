// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
macro package test
internal import std.ast.*
internal import A.*

public macro b1(x:Tokens,y:Tokens){
    var res = @a1[1](1)
    public macro b2(x:Tokens,y:Tokens){      
        var res = @a2[1](1)
        quote($res)
    }
    quote(res)
}

main(): Int64 {
    return 0
}

// ASEERT: regex-not core dump
// ASEERT: regex-not stack trace

/* SCAN
error: unexpected macro declaration in macro body
 ==> test_macro12.cj:8:12:
  | 
6 | public macro b1(x:Tokens,y:Tokens){
  |        ~~~~~ in macro
7 |     var res = @a1[1](1)
8 |     public macro b2(x:Tokens,y:Tokens){      
  |            ^^^^^ unexpected macro declaration
  | 

1 error generated, 1 error printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

