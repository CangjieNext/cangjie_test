//ERRCHECK: %compiler %cmp_opt %incrementalCompile %f -o %output

// just make sure astdiff did not crashed

enum F{
    @e(Int64)
}

main(): Int64 {
    eturn 0
}

/* SCAN
error: expected ';' or '<NL>', found literal '0'
  ==> ignore_expand_expr.cj:10:11:
   | 
10 |     eturn 0
   |           ^ expected ';' or '<NL>' here
   | 

error: expected expression or declaration, found '}'
  ==> ignore_expand_expr.cj:11:1:
   | 
11 | }
   | ^ expected expression or declaration here
   | 

2 errors generated, 2 errors printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
