// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %n.old.cj -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %n.old.cj -o %output 2>&1 %cmp_opt | compare %f
/* SCAN-IN
illegal source code leads to duplicated raw mangle name, roll back to full compilation
full sema
error: function 'foo' has overload conflicts
 ==> AddPublicInstanceFunc_conflict.old.cj:5:17:
  | 
5 |     public func foo(): Int64 { 18 }
  |                 ^^^ 
  | 
note: conflict with the declaration
 ==> AddPublicInstanceFunc_conflict.old.cj:4:17:
  | 
4 |     public func foo(): Int64 { 15 }
  |                 ^^^ 
  | 

error: ambiguous match for function call 'foo'
  ==> AddPublicInstanceFunc_conflict.old.cj:10:7:
   | 
10 |     a.foo() - 9
   |       ^ 
   | 
note: found candidate
 ==> AddPublicInstanceFunc_conflict.old.cj:4:17:
  | 
4 |     public func foo(): Int64 { 15 }
  |                 ^ 
  | 
note: found candidate
 ==> AddPublicInstanceFunc_conflict.old.cj:5:17:
  | 
5 |     public func foo(): Int64 { 18 }
  |                 ^ 
  | 

2 errors generated, 2 errors printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
