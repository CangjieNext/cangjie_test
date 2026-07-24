// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a const Option selector makes a non-matching case unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    const option = Option<Int64>.Some(1)
    match (option) {
        case None => println("unreachable None case")
        case _ => println("Option fallback")
    }
}

/* SCAN
warning: unreachable pattern
  ==> const_option_match_selector.cj:13:14:
   | 
13 |         case None => println("unreachable None case")
   |              ^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
