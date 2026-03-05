// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func a() {
    var a = 1
    var b = 2
    var c = 3
    1 + 2
    a + b   // has warning
    0
}

public func b() {
    var a = 9223372036854775807
    var b = 2
    a + b   // has warning
    0
}

@OverflowWrapping
func test1() {
    var a = 1
    var b = 2
    var c = 3
    a + b   // has warning
    0
}

public func test2() {
    var a = 1
    a
    a
    a
    0
}

main() {
    a()
    test1()
    test2()
    b()
    return 0
}

/* SCAN
warning: unused variable:'c'
  ==> testUnusedCode01.cj:12:9:
   | 
12 |     var c = 3
   |         ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused result of the operator:'+'
  ==> testUnusedCode01.cj:13:7:
   | 
13 |     1 + 2
   |       ^ unused result of the operator
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused result of the operator:'+'
  ==> testUnusedCode01.cj:14:7:
   | 
14 |     a + b   // has warning
   |       ^ unused result of the operator
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '+' overflow
  ==> testUnusedCode01.cj:21:5:
   | 
21 |     a + b   // has warning
   |     ^^^^^ operation 'Int64(9223372036854775807) + Int64(2)' would overflow
   | 
   # note: range of Int64 is -9223372036854775808 ~ 9223372036854775807

warning: unused variable:'c'
  ==> testUnusedCode01.cj:29:9:
   | 
29 |     var c = 3
   |         ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused result of the operator:'+'
  ==> testUnusedCode01.cj:30:7:
   | 
30 |     a + b   // has warning
   |       ^ unused result of the operator
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'a'
  ==> testUnusedCode01.cj:35:9:
   | 
35 |     var a = 1
   |         ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testUnusedCode01.cj:36:5:
   | 
36 |     a
   |     ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testUnusedCode01.cj:37:5:
   | 
37 |     a
   |     ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testUnusedCode01.cj:38:5:
   | 
38 |     a
   |     ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 error generated, 1 error printed.
9 warnings generated, 9 warnings printed.
*/
