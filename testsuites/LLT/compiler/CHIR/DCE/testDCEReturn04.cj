// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

func foo(): Int64 {
    return try {
        return 0
    } catch (_) {
        return 1
    }
}

func foo1(): Int64 {
    try {
        return 0
    } catch (_) {
        return 1
    }
}

main() {
    foo()
    foo1()
    0
}

/* SCAN
warning: unreachable expression
  ==> testDCEReturn04.cj:11:5:
   | 
11 |        return try {
   |  ______^______~
   | | _____|
12 | ||         return 0
   | || ...
15 | ||     }
   | |______^ any code following this expression is unreachable
   |  |_____|
   |        
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
