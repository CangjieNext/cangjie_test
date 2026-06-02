// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args

main() {
    let arr9: VArray<Int64, $6> = [0, 1, 2, 3, 4, 5]
    let size: Int64 = arr9.size
    if (size != 6) {
        return 1
    }
    0
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> testUnusedVariable10.cj:13:20:
   | 
13 |       if (size != 6) {
   |  ____________________^
14 | |         return 1
15 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
