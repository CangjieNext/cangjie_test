// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %f %enableO2 -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

public func foo() {
    for (_ in 0..0) {
        var _ = 1
    }
}

main() {
    0
}

/* SCAN
warning: unreachable block in 'for' expression
  ==> testDCEfor01.cj:13:21:
   | 
13 |       for (_ in 0..0) {
   |  _____________________^
14 | |         var _ = 1
15 | |     }
   | |_____^ unreachable block in 'for' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
