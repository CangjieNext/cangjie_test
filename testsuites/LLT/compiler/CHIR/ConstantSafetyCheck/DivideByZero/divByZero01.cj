// LEVEL: 0
// (DEBUG_OPTION) EXEC-PIPE-1: %compiler %disableSemaConstCheck %cmp_opt %f -o %output 2>&1 | compare %f

var g0 = 1
var g1 = true

public func divByZero01() {
    var a1 = 0
    var a2 = a1 / 0
    var a3 = a2 / a1
    var a4 = a2 % 0
    var a5 = g0 % 0
}

public func divByZero02() {
    var a1 = 1
    a1 /= 0
    a1 %= 0
}

public func divByZero03() {
    var a1 = 5
    var a2 = a1 + 5
    var a3 = a2 / (a1 - a2 / 2)
    var a4 = g0 % if (g1) { println(1); a1 - 5} else { println(2); a1 / 5 - 1}
}

main() {}

/* SCAN
error: divide by zero
 ==> divByZero01.cj:9:14:
  | 
9 |     var a2 = a1 / 0
  |              ^^^^^^ attempt to divide by zero
  | 

warning: unused variable:'a3'
  ==> divByZero01.cj:10:9:
   | 
10 |     var a3 = a2 / a1
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: divide by zero
  ==> divByZero01.cj:10:14:
   | 
10 |     var a3 = a2 / a1
   |              ^^^^^^^ attempt to divide by zero
   | 

warning: unused variable:'a4'
  ==> divByZero01.cj:11:9:
   | 
11 |     var a4 = a2 % 0
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: modulo by zero
  ==> divByZero01.cj:11:14:
   | 
11 |     var a4 = a2 % 0
   |              ^^^^^^ attempt to modulo by zero
   | 

warning: unused variable:'a5'
  ==> divByZero01.cj:12:9:
   | 
12 |     var a5 = g0 % 0
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: modulo by zero
  ==> divByZero01.cj:12:14:
   | 
12 |     var a5 = g0 % 0
   |              ^^^^^^ attempt to modulo by zero
   | 

error: divide by zero
  ==> divByZero01.cj:17:5:
   | 
17 |     a1 /= 0
   |     ^^^^^^^ attempt to divide by zero
   | 

error: modulo by zero
  ==> divByZero01.cj:18:5:
   | 
18 |     a1 %= 0
   |     ^^^^^^^ attempt to modulo by zero
   | 

warning: unused variable:'a3'
  ==> divByZero01.cj:24:9:
   | 
24 |     var a3 = a2 / (a1 - a2 / 2)
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: divide by zero
  ==> divByZero01.cj:24:14:
   | 
24 |     var a3 = a2 / (a1 - a2 / 2)
   |              ^^^^^^^^^^^^^^^^^^ attempt to divide by zero
   | 

warning: unused variable:'a4'
  ==> divByZero01.cj:25:9:
   | 
25 |     var a4 = g0 % if (g1) { println(1); a1 - 5} else { println(2); a1 / 5 - 1}
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: modulo by zero
  ==> divByZero01.cj:25:14:
   | 
25 |     var a4 = g0 % if (g1) { println(1); a1 - 5} else { println(2); a1 / 5 - 1}
   |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ attempt to modulo by zero
   | 

8 errors generated, 8 errors printed.
5 warnings generated, 5 warnings printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
