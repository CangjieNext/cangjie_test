// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %enableO2 %disableConstPropagation %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    do {
        (2.4, 3.5)
        return 0
    } while (true)
    return 1
}

/* SCAN
warning: unused expression
  ==> testDCEDowhile17.cj:12:9:
   | 
12 |         (2.4, 3.5)
   |         ^^^^^^^^^^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
