// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func foo() {
    var a = 1
    return 1
    a--
    return 2
}

main(): Int64 {
    foo()
    var int8_Low_bound_One: Int8 = -128
    int8_Low_bound_One--

    return 1
}

/* SCAN
warning: unused variable:'a'
  ==> testDCEAsg05.cj:10:9:
   | 
10 |     var a = 1
   |         ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEAsg05.cj:12:5:
   | 
11 |     return 1
   |     ~~~~~~~~ any code following this expression is unreachable
12 |     a--
   |     ^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '-' overflow
  ==> testDCEAsg05.cj:19:5:
   | 
19 |     int8_Low_bound_One--
   |     ^^^^^^^^^^^^^^^^^^^^ operation 'Int8(-128) - Int8(1)' would overflow
   | 
   # note: range of Int8 is -128 ~ 127

1 error generated, 1 error printed.
2 warnings generated, 2 warnings printed.
*/
