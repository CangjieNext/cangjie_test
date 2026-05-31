// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f


@Java
foreign struct S {

}

/* SCAN-IN

error: unexpected annotation '@Java' on struct
 ==> java_mirror_struct.cj:4:1:
  | 
4 | @Java
  | ^^^^^ unexpected annotation here
5 | foreign struct S {
  |         ~~~~~~ on struct
  | 

error: unexpected modifier 'foreign' on struct declaration
 ==> java_mirror_struct.cj:5:1:
  | 
5 | foreign struct S {
  | ^^^^^^^ ~~~~~~ on struct declaration
  | |
  | unexpected modifier
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

