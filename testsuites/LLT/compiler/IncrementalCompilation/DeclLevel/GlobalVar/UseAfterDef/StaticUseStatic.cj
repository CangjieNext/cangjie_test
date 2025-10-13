// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.old.cj -o %output -Woff unused
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.old.cj -o %output -Woff unused 2>&1 | compare %f

// ASSERT: scan changed decls to recompile: 2
// ASSERT: scan the changed decl after Spreading is:b in file StaticUseStatic.old.cj in line 9 in column 23
/* SCAN-IN
error: variable 'a' is used before initialization
 ==> StaticUseStatic.old.cj:9:31:
  | 
9 |     public static let b = 3 - a
  |                               ^ 
  | 

1 error generated, 1 error printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
