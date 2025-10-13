to test the '--test' option ('cmp_utest_opt') under incremental compilation

// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.old.cj -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args >%redirectNull
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.old.cj -o %output %cmp_utest_opt 2>&1 | compare %f
// ASSERT: scan 2 order changed decl(s).
// ASSERT: scan order change 7default1bV$$
// ASSERT: scan order change 1c1d
/* SCAN-IN
error: variable 'a' is used before being defined
 ==> test.old.cj:2:9:
  | 
2 | var b = a + 1
  |         ^ 
  | 

error: variable 'a' is used before being defined
 ==> test.old.cj:3:19:
  | 
3 | let (c, d) = (b - a, b + a)
  |                   ^ 
  | 

2 errors generated, 2 errors printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
