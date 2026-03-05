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
  ==> testDCEApply01.cj:12:5:
   | 
12 |       func a(b: Int64): Int64 {
   |  _____^
13 | |         return 1
14 | |     }
   | |_____^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'b'
  ==> testDCEApply01.cj:12:12:
   | 
12 |     func a(b: Int64): Int64 {
   |            ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable 'call'
  ==> testDCEApply01.cj:17:9:
   | 
17 |         a(throw X())
   |         ^ ~~~~~~~~~ any code following this expression is unreachable
   |         |
   |         unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
