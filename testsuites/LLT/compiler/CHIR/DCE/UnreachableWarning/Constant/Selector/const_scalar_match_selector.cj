// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a const numeric selector makes a non-matching case unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    const number = 1 + 2
    match (number) {
        case 4 => println("unreachable number case")
        case _ => println("number fallback")
    }
}

/* SCAN
warning: unreachable pattern
  ==> const_scalar_match_selector.cj:13:14:
   | 
13 |         case 4 => println("unreachable number case")
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
