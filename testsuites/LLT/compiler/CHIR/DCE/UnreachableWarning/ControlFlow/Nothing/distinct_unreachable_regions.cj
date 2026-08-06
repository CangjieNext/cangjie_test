// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify that distinct unreachable regions in one function are each reported once.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func checkDistinctRegions(flag: Bool): Int64 {
    if (flag) {
        return 1
        println("first unreachable region")
        return 2
    }
    if (!flag) {
        return 3
        println("second unreachable region")
        return 4
    }
    return 5
}

main() {
    checkDistinctRegions(true)
}

/* SCAN
warning: unreachable expression
  ==> distinct_unreachable_regions.cj:13:9:
   | 
12 |         return 1
   |         ~~~~~~~~ any code following this expression is unreachable
13 |         println("first unreachable region")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> distinct_unreachable_regions.cj:18:9:
   | 
17 |         return 3
   |         ~~~~~~~~ any code following this expression is unreachable
18 |         println("second unreachable region")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
