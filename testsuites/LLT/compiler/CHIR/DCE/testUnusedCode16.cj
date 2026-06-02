// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let test = (1, 1)
    match (test) {
        case (0, _) => 1
        case _ => 0
    }
}

/* SCAN
warning: unreachable pattern
  ==> testUnusedCode16.cj:12:14:
   | 
12 |         case (0, _) => 1
   |              ^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
