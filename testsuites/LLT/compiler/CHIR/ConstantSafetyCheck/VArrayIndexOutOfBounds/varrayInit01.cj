// LEVEL: 0
// EXEC-PIPE-1: %compiler -Woff all %cmp_opt %f -o %output 2>&1 | compare %f

func foo1() {
    var b = 4
    var test: VArray<Int64, $3> = [1, 2, 3]
    var a = test[b]
    test[b] = 1
}

func foo2() {
    var b = 4
    var test: VArray<Int64, $3> = VArray<Int64, $3>({i => i})
    var a = test[b]
    test[b] = 1
}

func foo3() {
    var b = -4
    var test: VArray<Int64, $3> = VArray<Int64, $3>(repeat: 2)
    var a = test[b]
    test[b] = 1
}

main() {

}

/* SCAN
error: array index is out of bounds
 ==> varrayInit01.cj:7:13:
  | 
7 |     var a = test[b]
  |             ^^^^^^^ array index 4 is past the end of array (which contains 3 elements)
  | 

error: array index is out of bounds
 ==> varrayInit01.cj:8:5:
  | 
8 |     test[b] = 1
  |     ^^^^^^^^^^^ array index 4 is past the end of array (which contains 3 elements)
  | 

error: array index is out of bounds
  ==> varrayInit01.cj:14:13:
   | 
14 |     var a = test[b]
   |             ^^^^^^^ array index 4 is past the end of array (which contains 3 elements)
   | 

error: array index is out of bounds
  ==> varrayInit01.cj:15:5:
   | 
15 |     test[b] = 1
   |     ^^^^^^^^^^^ array index 4 is past the end of array (which contains 3 elements)
   | 

error: array index is out of bounds
  ==> varrayInit01.cj:21:13:
   | 
21 |     var a = test[b]
   |             ^^^^^^^ array index can not be negative
   | 

error: array index is out of bounds
  ==> varrayInit01.cj:22:5:
   | 
22 |     test[b] = 1
   |     ^^^^^^^^^^^ array index can not be negative
   | 

6 errors generated, 6 errors printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
