// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args

class A <: Exception {}

main() {
    try {
        throw A();
        1 + 1
    } catch (_) {
        2 + 2
    } finally {
    }
    print("success.")
    return 0
}

/* SCAN
warning: unreachable expression
  ==> testDCEThrow04.cj:15:9:
   | 
14 |         throw A();
   |         ~~~~~~~~~ any code following this expression is unreachable
15 |         1 + 1
   |         ^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused result of the operator:'+'
  ==> testDCEThrow04.cj:17:11:
   | 
17 |         2 + 2
   |           ^ unused result of the operator
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
