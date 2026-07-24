// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A constant tuple selector makes its non-matching wildcard unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main() {
    let pair = (1, 2)
    match (pair) {
        case (1, 2) => 0
        case _ => 1
    }
}

/* SCAN
warning: unreachable pattern
  ==> constant_tuple_selector.cj:15:14:
   | 
15 |         case _ => 1
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
