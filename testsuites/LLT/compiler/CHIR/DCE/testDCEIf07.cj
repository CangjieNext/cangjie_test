// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args %output 

func test() {
    if (return 0) {
        if (true) {
            return 1
            return 1
        } else {
            return 1
            return 1
        }
        if (false) {
            return 1
            return 1
        } else {
            return 1
            return 1
        }
    } else {
        return 1
        return 1
    }
}

main() {
    test()
}

/* SCAN
warning: unreachable expression
  ==> testDCEIf07.cj:11:5:
   | 
11 |       if (return 0) {
   |       ^   ~~~~~~~~ any code following this expression is unreachable
   |  _____|
12 | |         if (true) {
   | | ...
29 | |     }
   | |_____^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
