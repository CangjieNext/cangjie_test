// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %n.old.cj -o %output %noStackInfo
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %n.old.cj -o %output %noStackInfo %cmp_opt 2>&1 | compare %f
// ASSERT: scan illegal source code leads to duplicated raw mangle name, roll back to full compilation
/* SCAN-IN
error: interface 'Interface-I1<Int32>' has been implemented by 'Class-A', please remove it
 ==> InterfaceExtend1to2_front.old.cj:8:13:
  | 
8 | extend A <: I1<Int32> {
  |             ^^^^^^^^^ 
  | 

error: extend member 'foo' is not allowed to shadow members of 'extend A'
 ==> InterfaceExtend1to2_front.old.cj:6:17:
  | 
6 |     public func foo(): Int64 { 1 }
  |                 ^^^ 
  | 

error: extend member 'foo' is not allowed to shadow members of 'extend A'
 ==> InterfaceExtend1to2_front.old.cj:9:17:
  | 
9 |     public func foo(): Int64 { 1 }
  |                 ^^^ 
  | 

3 errors generated, 3 errors printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
