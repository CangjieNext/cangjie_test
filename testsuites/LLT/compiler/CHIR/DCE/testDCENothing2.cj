// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

class A {
    init(a: Nothing) {
    }
}

main() {
    var a = A(return)
}

/* SCAN
warning: unreachable function 
  ==> testDCENothing2.cj:11:10:
   | 
11 |     init(a: Nothing) {
   |          ^ function with parameter of nothing type will never be executed
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'a'
  ==> testDCENothing2.cj:16:9:
   | 
16 |     var a = A(return)
   |         ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCENothing2.cj:16:13:
   | 
16 |     var a = A(return)
   |             ^^^^^^^^^any code following this expression is unreachable
   |             |
   |             unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
