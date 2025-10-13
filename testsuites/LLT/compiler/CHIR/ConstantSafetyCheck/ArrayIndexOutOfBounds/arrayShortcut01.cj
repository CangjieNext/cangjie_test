// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

public func arrayShortcut01() {
    var a = 2
    var b: Array<Int32> = [0]
    if (true || if (true) {a = 1; true} else {true}) {
        b[a]
    }
    b[a]
}

public func arrayShortcut02() {
    var a = 2
    var b: Array<Int32> = [0]
    if (false && if (true) {a = 1; true} else {true}) {
        b[a]
    }
    b[a]
}

main() {}

/* SCAN
warning: unreachable expression
 ==> arrayShortcut01.cj:7:17:
  | 
7 |     if (true || if (true) {a = 1; true} else {true}) {
  |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
  | 
  # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
 ==> arrayShortcut01.cj:7:27:
  | 
7 |     if (true || if (true) {a = 1; true} else {true}) {
  |                           ^^^^^^^^^^^^^ unreachable block in 'if' expression
  | 
  # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
 ==> arrayShortcut01.cj:7:46:
  | 
7 |     if (true || if (true) {a = 1; true} else {true}) {
  |                                              ^^^^^^ unreachable block in 'if' expression
  | 
  # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: array index is out of bounds
 ==> arrayShortcut01.cj:8:9:
  | 
8 |         b[a]
  |         ^^^^ array index 2 is past the end of array (which contains 1 elements)
  | 

error: array index is out of bounds
  ==> arrayShortcut01.cj:10:5:
   | 
10 |     b[a]
   |     ^^^^ array index 2 is past the end of array (which contains 1 elements)
   | 

warning: unreachable expression
  ==> arrayShortcut01.cj:16:18:
   | 
16 |     if (false && if (true) {a = 1; true} else {true}) {
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> arrayShortcut01.cj:16:28:
   | 
16 |     if (false && if (true) {a = 1; true} else {true}) {
   |                            ^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> arrayShortcut01.cj:16:47:
   | 
16 |     if (false && if (true) {a = 1; true} else {true}) {
   |                                               ^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> arrayShortcut01.cj:16:55:
   | 
16 |       if (false && if (true) {a = 1; true} else {true}) {
   |  _______________________________________________________^
17 | |         b[a]
18 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: array index is out of bounds
  ==> arrayShortcut01.cj:19:5:
   | 
19 |     b[a]
   |     ^^^^ array index 2 is past the end of array (which contains 1 elements)
   | 

3 errors generated, 3 errors printed.
7 warnings generated, 7 warnings printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
