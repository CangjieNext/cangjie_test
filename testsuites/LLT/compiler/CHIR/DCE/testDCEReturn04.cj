// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args



func foo(): Int64 {
    // EXPECT: chir_dce_unreachable_expression_hint
    return try {
        return 0
    } catch (_) {
        return 1
    }
}

func foo1(): Int64 {
    try {
        return 0
    } catch (_) {
        return 1
    }
}

main() {
    foo()
    foo1()
    0
}

/* SCAN
warning: unreachable expression
  ==> testDCEReturn04.cj:14:5:
   | 
14 |       return try {
   |  _____^
15 | |         return 0
   | | ...
18 | |     }
   | |_____^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
