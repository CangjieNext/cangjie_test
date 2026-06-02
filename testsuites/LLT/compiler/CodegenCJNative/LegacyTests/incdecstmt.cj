// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f 

func codegenUnitTest(): Int32 {
    var n: Int32 = 1
    n++
    n--
    n++
    var a: Float64 = 0.0
    a++
    a--
    var b: Float32 = 0.0
    b++
    b--
    var c: Int8 = 0
    c++
    c--
    var d: Int16 = 0
    d++
    d--
    return n
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 2) {
        return 0
    } else {
        return -1
    }
}

/* SCAN
error: mismatched types
  ==> incdecstmt.cj:15:5:
   | 
15 |     a++
   |     ^ expected 'integer type', found 'Float64'
   | 
   # note: the base of increment or decrement expressions should be of integer type

error: mismatched types
  ==> incdecstmt.cj:16:5:
   | 
16 |     a--
   |     ^ expected 'integer type', found 'Float64'
   | 
   # note: the base of increment or decrement expressions should be of integer type

error: mismatched types
  ==> incdecstmt.cj:18:5:
   | 
18 |     b++
   |     ^ expected 'integer type', found 'Float32'
   | 
   # note: the base of increment or decrement expressions should be of integer type

error: mismatched types
  ==> incdecstmt.cj:19:5:
   | 
19 |     b--
   |     ^ expected 'integer type', found 'Float32'
   | 
   # note: the base of increment or decrement expressions should be of integer type

4 errors generated, 4 errors printed.
*/
