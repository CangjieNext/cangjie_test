// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %overflowOpt %f -o %n.%suffix 2>&1 | compare %f

var xx = ""

func func_1666684699867_176<T0>(): String {
    let arrayTest: Array<Int64> = [0, 1, 2]
    var loopTimeVar_1666684699867_5184: Int64 = 0;
    var ret: String = ""
    while (loopTimeVar_1666684699867_5184 < 2) {
        loopTimeVar_1666684699867_5184++;
        try {
            try {
                let lastElement = arrayTest[3]
            } finally {
                ret += "gg"
                return ret;
            }
        } finally {
            ret += "hh"
            xx += "xx"
        }
    }
    return ret;
}

main() {
    var test = func_1666684699867_176<Int64>();
    println(test)
    println(xx)
    if (test != "gg" && xx != "xx") {
        return 1;
    }
    return 0;
}

/* SCAN
warning: unused variable:'lastElement'
  ==> nested_try4.cj:19:21:
   | 
19 |                 let lastElement = arrayTest[3]
   |                     ^^^^^^^^^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: array index is out of bounds
  ==> nested_try4.cj:19:35:
   | 
19 |                 let lastElement = arrayTest[3]
   |                                   ^^^^^^^^^^^^ array index 3 is past the end of array (which contains 3 elements)
   | 

1 error generated, 1 error printed.
1 warning generated, 1 warning printed.
*/
