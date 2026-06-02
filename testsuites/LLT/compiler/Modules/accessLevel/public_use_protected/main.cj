// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./A
// EXEC: %compiler %cmp_opt %compile_lib_opt ./A/a/a.cj -o A.a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt A.a.%middle ./A/A.cj 2>&1 | compare %f

/* SCAN
error: 'public' declaration uses 'protected' types
  ==> ./A/A.cj:11:13:
   | 
11 | public func test(a!: T_a = T_a()) {
   |             ^^^^ 
   | 
note: type 'Class-T_a' contains 'protected' type
  ==> ./A/A.cj:11:22:
   | 
11 | public func test(a!: T_a = T_a()) {
   |                      ^^^ 
   | 
note: the 'protected' type is 'Class-T_a'
 ==> (package A.a)a.cj:9:17:

1 error generated, 1 error printed.
*/
