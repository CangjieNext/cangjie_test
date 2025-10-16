// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %n.old.cj -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %n.old.cj -o %output %cmp_opt 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 2
// ASSERT: scan the changed decl after Spreading is:main in file AddPrivateInstanceFunc_child.old.cj in line 7 in column 1
// ASSERT: scan the changed decl after Spreading is:some in file AddPrivateInstanceFunc_child.old.cj in line 20 in column 20
/* SCAN-IN
error: a deriving member must be at least as visible as its base member
  ==> AddPrivateInstanceFunc_child.old.cj:16:14:
   | 
16 | public class B <: A & IChild {
   |              ^ 'some' is inherited
   | 
note: the deriving 'some' is defined here
  ==> AddPrivateInstanceFunc_child.old.cj:20:20:
   | 
20 |     protected func some() {0}
   |                    ^^^^ the visibility of the deriving 'some' is 'protected'
   | 
note: the visibility of the base 'some' is 'public'
  ==> AddPrivateInstanceFunc_child.old.cj:14:10:
   | 
14 |     func some() {-1}
   |          ^^^^ the base 'some' is in 'interface'
   | 

1 error generated, 1 error printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
