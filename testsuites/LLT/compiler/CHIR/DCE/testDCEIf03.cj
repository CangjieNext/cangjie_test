// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args

main() {
    var a = 0
    return a
    if (true) {
        return 1
    } else {
        return 2
    }

    return 4
}

/* SCAN
warning: unreachable expression
  ==> testDCEIf03.cj:13:5:
   | 
12 |       return a
   |       ~~~~~~~~ any code following this expression is unreachable
13 |       if (true) {
   |  _____^
14 | |         return 1
   | | ...
17 | |     }
   | |_____^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
