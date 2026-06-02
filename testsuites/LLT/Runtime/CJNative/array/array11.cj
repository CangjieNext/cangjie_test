// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let arr = [1, 2, 3, 4, 5]
    var count = 0
    try {
        var arr1 = arr[1..3]
        var arr2 = arr[-1] // negative size
    } catch (e: Exception) {
        count++
    }
    if (count != 1) {
        return 2
    }

    return 0
}

/* SCAN
warning: unused variable:'arr1'
  ==> array11.cj:13:13:
   | 
13 |         var arr1 = arr[1..3]
   |             ^^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'arr2'
  ==> array11.cj:14:13:
   | 
14 |         var arr2 = arr[-1] // negative size
   |             ^^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: array index is out of bounds
  ==> array11.cj:14:20:
   | 
14 |         var arr2 = arr[-1] // negative size
   |                    ^^^^^^^ array index can not be negative
   | 

warning: unreachable block in 'if' expression
  ==> array11.cj:18:21:
   | 
18 |       if (count != 1) {
   |  _____________________^
19 | |         return 2
20 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 error generated, 1 error printed.
3 warnings generated, 3 warnings printed.
*/
