// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %n.old.cj -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %n.old.cj -o %output 2>&1 %cmp_opt | compare %f
/* SCAN-IN
illegal source code leads to duplicated raw mangle name, roll back to full compilation
full sema
error: function 'foo' has overload conflicts
 ==> AddPrivateInstanceFunc_conflict.old.cj:5:18:
  | 
5 |     private func foo(): Int64 { 18 }
  |                  ^^^ 
  | 
note: conflict with the declaration
 ==> AddPrivateInstanceFunc_conflict.old.cj:4:10:
  | 
4 |     func foo(): Int64 { 15 }
  |          ^^^ 
  | 

1 error generated, 1 error printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
