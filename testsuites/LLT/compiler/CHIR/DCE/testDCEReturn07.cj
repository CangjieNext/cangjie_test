// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args

public func test() {
    1
    return 1
    1
}

main() {
    test()
    0
}

/* SCAN
warning: unused expression
  ==> testDCEReturn07.cj:11:5:
   | 
11 |     1
   |     ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEReturn07.cj:13:5:
   | 
12 |     return 1
   |     ~~~~~~~~ any code following this expression is unreachable
13 |     1
   |     ^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
