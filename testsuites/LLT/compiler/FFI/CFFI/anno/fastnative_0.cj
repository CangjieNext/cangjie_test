// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f -o %output 2>&1 | compare %f

@FastNative
func foo1() {}

@FastNative[X]
func foo2() {}

@FastNative
class A {}

@FastNative
struct B {}

@FastNative
enum C { C1 }

@FastNative
var a = 1

main() {}

/* SCAN
error: non-foreign function cannot be modified with '@FastNative'
 ==> fastnative_0.cj:3:1:
  | 
3 | @FastNative
  | ^ 
  | 

error: '@FastNative' should have no arg
 ==> fastnative_0.cj:6:13:
  | 
6 | @FastNative[X]
  |             ^ 
  | 

error: non-foreign function cannot be modified with '@FastNative'
 ==> fastnative_0.cj:6:1:
  | 
6 | @FastNative[X]
  | ^ 
  | 

error: class cannot be modified with '@FastNative'
 ==> fastnative_0.cj:9:1:
  | 
9 | @FastNative
  | ^ 
  | 

error: struct cannot be modified with '@FastNative'
  ==> fastnative_0.cj:12:1:
   | 
12 | @FastNative
   | ^ 
   | 

error: enum cannot be modified with '@FastNative'
  ==> fastnative_0.cj:15:1:
   | 
15 | @FastNative
   | ^ 
   | 

error: variable cannot be modified with '@FastNative'
  ==> fastnative_0.cj:18:1:
   | 
18 | @FastNative
   | ^ 
   | 

7 errors generated, 7 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
