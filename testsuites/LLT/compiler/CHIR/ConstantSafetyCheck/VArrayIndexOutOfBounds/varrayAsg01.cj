// LEVEL: 0
// EXEC-PIPE-1: %compiler -Woff all %cmp_opt %f -o %output 2>&1 | compare %f

func foo1() {
    var b = 4
    var test: VArray<Int64, $3> = [1, 2, 3]
    var test1 = test
    var a = test1[b]
    test1[b] = 1
}

func foo2() {
    var b = 4
    var test: VArray<Int64, $3> = VArray<Int64, $3>({i => i})
    var test1 = test
    var a = test1[b]
    test1[b] = 1
}

func foo3() {
    var b = 4
    var test: VArray<Int64, $3> = VArray<Int64, $3>(repeat: 2)
    var test1 = test
    var a = test1[b]
    test1[b] = 1
}

main() {

}

/* SCAN
error: array index is out of bounds
 ==> varrayAsg01.cj:8:13:
  | 
8 |     var a = test1[b]
  |             ^^^^^^^^ array index 4 is past the end of array (which contains 3 elements)
  | 

error: array index is out of bounds
 ==> varrayAsg01.cj:9:5:
  | 
9 |     test1[b] = 1
  |     ^^^^^^^^^^^^ array index 4 is past the end of array (which contains 3 elements)
  | 

error: array index is out of bounds
  ==> varrayAsg01.cj:16:13:
   | 
16 |     var a = test1[b]
   |             ^^^^^^^^ array index 4 is past the end of array (which contains 3 elements)
   | 

error: array index is out of bounds
  ==> varrayAsg01.cj:17:5:
   | 
17 |     test1[b] = 1
   |     ^^^^^^^^^^^^ array index 4 is past the end of array (which contains 3 elements)
   | 

error: array index is out of bounds
  ==> varrayAsg01.cj:24:13:
   | 
24 |     var a = test1[b]
   |             ^^^^^^^^ array index 4 is past the end of array (which contains 3 elements)
   | 

error: array index is out of bounds
  ==> varrayAsg01.cj:25:5:
   | 
25 |     test1[b] = 1
   |     ^^^^^^^^^^^^ array index 4 is past the end of array (which contains 3 elements)
   | 

6 errors generated, 6 errors printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
