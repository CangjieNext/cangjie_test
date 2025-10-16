// ERRCHECK: %pwd_to_ld_path %compiler %cmp_opt %f -o %output

macro package define

internal import std.ast.*

public macro test(input:Int64):Int64{ 
    input
}

main() {
    return 0
}

/* SCAN
error: macro declaration's parameter type must be 'Tokens'
 ==> macro_type_check.cj:7:25:
  | 
7 | public macro test(input:Int64):Int64{ 
  |                         ^^^^^ expected 'Tokens' here
  | 

error: macro declaration's return type must be 'Tokens'
 ==> macro_type_check.cj:7:32:
  | 
7 | public macro test(input:Int64):Int64{ 
  |                                ^^^^^ expected 'Tokens' here, got 'keyword 'Int64''
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

