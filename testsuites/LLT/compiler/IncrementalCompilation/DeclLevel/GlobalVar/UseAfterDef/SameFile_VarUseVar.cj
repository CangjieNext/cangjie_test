// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.old.cj -o %output
// EXEC-2: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan 1 order changed decl(s).
// ASSERT: scan order change 7default1bV$$
/* SCAN-IN
error: variable 'a' is used before being defined
 ==> SameFile_VarUseVar.old.cj:2:9:
  | 
2 | let b = a + 1
  |         ^ 
  | 

1 error generated, 1 error printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
