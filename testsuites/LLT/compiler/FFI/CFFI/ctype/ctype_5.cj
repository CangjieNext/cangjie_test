// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %verbose_opt %f -o %output 2>&1 | compare %f

class A <: CType {}

class B {}

extend B <: CType {}

struct A1 <: CType {}

struct B2 {}

extend B2 <: CType {}

interface X <: CType {}

main() {}

/* SCAN-IN
error: 'CType' interface is not able to be implemented explicitly
 ==> ctype_5.cj:3:12:
  | 
3 | class A <: CType {}
  |            ^ 
  | 

error: 'CType' interface is not able to be implemented explicitly
 ==> ctype_5.cj:9:14:
  | 
9 | struct A1 <: CType {}
  |              ^ 
  | 

error: 'CType' interface is not able to be inherited
  ==> ctype_5.cj:15:16:
   | 
15 | interface X <: CType {}
   |                ^ 
   | 

error: interface 'CType' is not able to be extended
 ==> ctype_5.cj:7:13:
  | 
7 | extend B <: CType {}
  |             ^^^^^ 
  | 

error: interface 'CType' is not able to be extended
  ==> ctype_5.cj:13:14:
   | 
13 | extend B2 <: CType {}
   |              ^^^^^ 
   | 
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
