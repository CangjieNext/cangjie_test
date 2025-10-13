// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan 1 order changed decl(s).
// ASSERT: scan order change 1b1c
/* SCAN-IN
error: variable 'a' is used before being defined
 ==> VpUseVar.old.cj:3:15:
  | 
3 | var (b, c) = (a+1, a-1)
  |               ^ 
  | 
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
