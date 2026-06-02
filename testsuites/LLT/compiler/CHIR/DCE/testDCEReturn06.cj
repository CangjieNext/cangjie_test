// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args

public func test() {
    return (1, 3)
    return (1, 2)
}

main() {
    test()
    0
}

/* SCAN
warning: unreachable expression
  ==> testDCEReturn06.cj:12:5:
   | 
11 |     return (1, 3)
   |     ~~~~~~~~~~~~~ any code following this expression is unreachable
12 |     return (1, 2)
   |     ^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
