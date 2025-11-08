// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

var g0: Int64 = 1

public func arrayInit01() {
    var a1 = [1]
    g0 = a1[1]
    a1 = [1, 2, 3]
    g0 = a1[1]
    g0 = a1[-1]
    a1 = [4]
    g0 = a1[1]
}

public func arrayInit02(temp: Array<Int64>) {
    var a1 = [1]
    a1 = temp
    g0 = a1[1]
}

main() {
    arrayInit01()
    arrayInit02([1])
    0
}

/* SCAN
error: array index is out of bounds
 ==> arrayInit02.cj:8:10:
  | 
8 |     g0 = a1[1]
  |          ^^^^^ array index 1 is past the end of array (which contains 1 elements)
  | 

error: array index is out of bounds
  ==> arrayInit02.cj:11:10:
   | 
11 |     g0 = a1[-1]
   |          ^^^^^^ array index can not be negative
   | 

error: array index is out of bounds
  ==> arrayInit02.cj:13:10:
   | 
13 |     g0 = a1[1]
   |          ^^^^^ array index 1 is past the end of array (which contains 1 elements)
   | 

3 errors generated, 3 errors printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
