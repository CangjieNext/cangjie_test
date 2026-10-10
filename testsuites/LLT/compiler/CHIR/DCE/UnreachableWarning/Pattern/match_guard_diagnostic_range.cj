// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a rejected guard is diagnosed at the guard rather than the complete case head.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %compiler %cmp_opt -O2 %f -o %output

main(args: Array<String>) {
    match (args.size) {
        case 2 | 3 where false => 0
        case _ => 1
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> match_guard_diagnostic_range.cj:13:26:
   | 
13 |         case 2 | 3 where false => 0
   |                          ^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
