// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A {
    func test() {
        var a = -(return 9)
        var b = 2
        0
    }
}

main() {
    var a = A()
    a.test()
    0
}

/* SCAN
warning: unused variable:'a'
  ==> testDCEUnary02.cj:11:13:
   | 
11 |         var a = -(return 9)
   |             ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable 'operator'
  ==> testDCEUnary02.cj:11:17:
   | 
11 |         var a = -(return 9)
   |                 ^ ~~~~~~~~ any code following this expression is unreachable
   |                 |
   |                 unreachable 'operator'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
