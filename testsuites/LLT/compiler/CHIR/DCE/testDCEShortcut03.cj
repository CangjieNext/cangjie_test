// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

main() {
    let rt_opnd1: Bool = true
    let _ = false && rt_opnd1
    0
}

/* SCAN
warning: unused variable:'rt_opnd1'
  ==> testDCEShortcut03.cj:11:9:
   | 
11 |     let rt_opnd1: Bool = true
   |         ^^^^^^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEShortcut03.cj:12:22:
   | 
12 |     let _ = false && rt_opnd1
   |                      ^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
