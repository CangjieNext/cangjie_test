// ERRCHECK: %compiler %noColor %f %cmp_macro

macro package A

import std.ast.*

public macro a1(x:Tokens, y:Tokens){
    quote(0)
}

public func macroCall_a_a1(abc :Int32){ 
    0
}

func aaa(){
    var aa = macroCall_a_a1
    aa(10)  
	macroCall_a_a1(12)
    0
}


/* SCAN-IN
error: cannot use 'public' on func declarations in a macro package
  ==> test_macro13.cj:11:1:
   | 
3  | macro package A
   | ~~~~~~~~~~~~~ macro package defined here
4  | 
   | ...
11 | public func macroCall_a_a1(abc :Int32){ 
   | ^^^^^^ 
   | 
   # note: Declarations in 'macro package' cannot be accessed in other packages, except macro declarations.

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

