// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A {
    public operator func [](index: Int64) {
        return index;
    }
}

main() {
    var a = A();
    a[0]
    a[return 1]
    0
}

/* SCAN
warning: unused expression
  ==> testDCEArray01.cj:18:5:
   | 
18 |     a[return 1]
   |     ^^^^^^^^^^^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEArray01.cj:19:5:
   | 
18 |     a[return 1]
   |     ~~~~~~~~~~~ any code following this expression is unreachable
19 |     0
   |     ^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
