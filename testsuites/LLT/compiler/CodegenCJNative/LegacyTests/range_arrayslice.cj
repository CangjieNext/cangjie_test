// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f

// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

var gRange1 = Int64(0)..10:3

func codegenUnitTest(): Int64 {
    var arr1 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    let range1 = Int64(0)..10:2
    let arr2 = arr1[range1]
    var a = arr2[2]  // 4

    let arr3 = arr1[0..10]
    var b = arr3[2]  // 2

    let arr4 = arr1[..4:-1]
    var c = arr4[2]  // 7

    var d = 0
    for (i in arr1[1..:4]) {
        d = d + i
    }   //  15

    var e = 0
    for (i in [0,11,22,33,44,55][1..:4]) {
        e = e + i
    }   //  66

    var f = 0
    for (i in [0,11,22,33,44,55][1..:4][..2]) {
        f = f + i
    }   //  66

    let arr5 = arr1[gRange1]
    var g = arr5[2]  // 6

    let arr6 = arr1[Int64(0)..:4]
    var h = arr6[2]  // 8

    var range2 = Int64(0)..10:3
    var i = if (gRange1 == range2) { 1 } else { 2 }  // 1
    var j = if ((Int64(0)..10:4) != (Int64(0)..10:1)) { 1 } else { 2 } // 1

    return a+b+c+d+e+f+g+h // 174
}

main(): Int64{
    var ret = codegenUnitTest()
    if(ret == 174){
        return 0
    }else{
        return -1
    }
}


/* SCAN
error: unexpected ':' in index access
  ==> range_arrayslice.cj:24:24:
   | 
24 |     let arr4 = arr1[..4:-1]
   |                     ~~~^ unexpected ':' here
   | 
   # note: range expression in index access cannot have step if it is without start or end

error: unexpected ':' in index access
  ==> range_arrayslice.cj:28:23:
   | 
28 |     for (i in arr1[1..:4]) {
   |                    ~~~^ unexpected ':' here
   | 
   # note: range expression in index access cannot have step if it is without start or end

error: unexpected ':' in index access
  ==> range_arrayslice.cj:33:37:
   | 
33 |     for (i in [0,11,22,33,44,55][1..:4]) {
   |                                  ~~~^ unexpected ':' here
   | 
   # note: range expression in index access cannot have step if it is without start or end

error: unexpected ':' in index access
  ==> range_arrayslice.cj:38:37:
   | 
38 |     for (i in [0,11,22,33,44,55][1..:4][..2]) {
   |                                  ~~~^ unexpected ':' here
   | 
   # note: range expression in index access cannot have step if it is without start or end

error: unexpected ':' in index access
  ==> range_arrayslice.cj:45:31:
   | 
45 |     let arr6 = arr1[Int64(0)..:4]
   |                     ~~~~~~~~~~^ unexpected ':' here
   | 
   # note: range expression in index access cannot have step if it is without start or end

5 errors generated, 5 errors printed.
*/
