// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.old.cj -o %output %compile_lib_opt
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.old.cj -o %output %compile_lib_opt 2>&1 | compare %f
// ASSERT: scan 1 order changed decl(s).
// ASSERT: scan order change 7default1AC1AY
/* SCAN-IN
error: variable 'a' is used before being defined
 ==> P.old.cj:3:18:
  | 
3 |     A() {println(a)}
  |                  ^ 
  | 

1 error generated, 1 error printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
