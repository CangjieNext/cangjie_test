// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -L . -l %n -o %output 2>&1 | compare %f
// ASSERT: scan-not core-dumped
func foo(...) { 0 }

main() { 0 }

/* SCAN
error: variable length parameter can only show in the foreign function
 ==> vararg_1.cj:3:1:
  | 
3 | func foo(...) { 0 }
  | ^^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
