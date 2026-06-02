// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

public func test() {
    var a = 0
    while (false) {
        a++

        var b = 1
    }
    return a
}

public func test1() {
    var a = 0
    do {
        a++
    } while (false)
    return a
}

main() {
    test()
    test1()
    return 0
}

/* SCAN
warning: unreachable block in 'while' expression
  ==> testDCEWhile09.cj:12:19:
   | 
12 |       while (false) {
   |  ___________________^
13 | |         a++
   | | ...
16 | |     }
   | |_____^ unreachable block in 'while' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
