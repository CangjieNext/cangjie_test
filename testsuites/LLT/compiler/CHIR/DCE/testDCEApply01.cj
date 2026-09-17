// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f





class X <: Exception {}

class A {
    func a(b: Int64): Int64 {
        return 1
    }

    func b() {
        a(throw X())
        return 2
    }
}

main() {
    A().b()
    0
}

/* SCAN
warning: unused function:'a'
  ==> testDCEApply01.cj:16:5:
   | 
16 |       func a(b: Int64): Int64 {
   |  _____^
17 | |         return 1
18 | |     }
   | |_____^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'b'
  ==> testDCEApply01.cj:16:12:
   | 
16 |     func a(b: Int64): Int64 {
   |            ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable 'call'
  ==> testDCEApply01.cj:21:9:
   | 
21 |         a(throw X())
   |         ^ ~~~~~~~~~ any code following this expression is unreachable
   |         |
   |         unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEApply01.cj:22:9:
   | 
21 |         a(throw X())
   |         ~~~~~~~~~~~~ any code following this expression is unreachable
22 |         return 2
   |         ^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

4 warnings generated, 4 warnings printed.
*/
