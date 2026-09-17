// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a constant condition remains diagnosed inside a lambda.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let double = { value: Int64 =>
        if (true) {
            value * 2
        } else {
            0
        }
    }
    println(double(1))
}

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> lambda_constant_condition.cj:14:16:
   | 
14 |           } else {
   |  ________________^
15 | |             0
16 | |         }
   | |_________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
