// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

public func foo(a: Nothing) {
    a
}

func goo(a: Nothing) {
    a
}

main() {
    return 0
}

/* SCAN
warning: unused function:'foo'
  ==> testDCENothing1.cj:10:1:
   | 
10 |   public func foo(a: Nothing) {
   |  _^
11 | |     a
12 | | }
   | |_^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable function 
  ==> testDCENothing1.cj:10:17:
   | 
10 | public func foo(a: Nothing) {
   |                 ^ function with parameter of nothing type will never be executed
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused function:'goo'
  ==> testDCENothing1.cj:14:1:
   | 
14 |   func goo(a: Nothing) {
   |  _^
15 | |     a
16 | | }
   | |_^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable function 
  ==> testDCENothing1.cj:14:10:
   | 
14 | func goo(a: Nothing) {
   |          ^ function with parameter of nothing type will never be executed
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

4 warnings generated, 4 warnings printed.
*/
