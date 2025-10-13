// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

var g0 = true

public func arrayInit01() {
    var a1: Array<Int64>
    if (g0) {
        a1 = Array<Int64>(3, repeat:1)
    } else {
        a1 = Array<Int64>(3, repeat:2)
    }
    var a2 = a1.get(5)
}

main() {}

/* SCAN
warning: unused variable:'a2'
  ==> arrayInit03.cj:13:9:
   | 
13 |     var a2 = a1.get(5)
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: array index is out of bounds
  ==> arrayInit03.cj:13:14:
   | 
13 |     var a2 = a1.get(5)
   |              ^^^^^^^^^ array index 5 is past the end of array (which contains 3 elements)
   | 

1 error generated, 1 error printed.
1 warning generated, 1 warning printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
