// ERRCHECK: %pwd_to_ld_path %compiler %cmp_opt %f -o %output

macro package define

internal import std.ast.*

public macro test(a:Tokens,b:Tokens,c:Tokens):Tokens{ 
    a
}

main() {
    return 0
}

/* SCAN
error: too many parameters in macro declaration
 ==> macro_input_checkerr.cj:7:19:
  | 
7 | public macro test(a:Tokens,b:Tokens,c:Tokens):Tokens{ 
  |                   ^ too many parameters here
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

