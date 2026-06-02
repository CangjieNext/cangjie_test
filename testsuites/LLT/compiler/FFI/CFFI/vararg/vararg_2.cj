// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -L . -l %n -o %output 2>&1 | compare %f
// ASSERT: scan-not core-dumped
foreign func foo(a1: Int64, ..., a2: Int64)

main() { 0 }

/* SCAN
error: foreign function must declare its return type
 ==> vararg_2.cj:3:1:
  | 
3 | foreign func foo(a1: Int64, ..., a2: Int64)
  | ^^^^^^^^^^^^ 
  | 

error: variable length parameter must in the end of the parameter list
 ==> vararg_2.cj:3:29:
  | 
3 | foreign func foo(a1: Int64, ..., a2: Int64)
  |                             ^^^ 
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
