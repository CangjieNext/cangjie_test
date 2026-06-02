// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: testDCEBinary02.info
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args %output 2>&1 | compare testDCEBinary02.info

class A {
    func test() {
        println("ok")
        0
    }

    func test1() {
        var a = test() + return 9999
        var b = 2
        0
    }
}

main() {
    var a = A()
    return a.test1() - 9999
}

/* SCAN
warning: unused variable:'a'
  ==> testDCEBinary02.cj:18:13:
   | 
18 |         var a = test() + return 9999
   |             ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable 'operator'
  ==> testDCEBinary02.cj:18:24:
   | 
18 |         var a = test() + return 9999
   |                        ^ ~~~~~~~~~~~ any code following this expression is unreachable
   |                        |
   |                        unreachable 'operator'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
