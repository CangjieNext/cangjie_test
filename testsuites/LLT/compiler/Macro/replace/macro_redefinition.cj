// ERRCHECK: %pwd_to_ld_path %compiler %cmp_opt %f -o %output

macro package define

internal import std.ast.*

public macro test(input: Tokens) {
    return quote(1)
}

public macro test(input: Tokens) {
    return quote(0)
}

main() {
    return 0
}

/* SCAN
error: redefinition of macro 'test'
  ==> macro_redefinition.cj:11:1:
   | 
11 | public macro test(input: Tokens) {
   | ^ 
   | 

error: redefinition of macro 'test'
 ==> macro_redefinition.cj:7:1:
  | 
7 | public macro test(input: Tokens) {
  | ^ 
  | 

error: macro 'test' has overload conflicts
  ==> macro_redefinition.cj:11:14:
   | 
11 | public macro test(input: Tokens) {
   |              ^^^^ 
   | 
note: conflict with the declaration
 ==> macro_redefinition.cj:7:14:
  | 
7 | public macro test(input: Tokens) {
  |              ^^^^ 
  | 

3 errors generated, 3 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

