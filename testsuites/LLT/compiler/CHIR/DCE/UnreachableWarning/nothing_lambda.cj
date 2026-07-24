// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a throw makes the following lambda expression unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main() {
    let action = {
        =>
        throw Exception()
        println("unreachable lambda")
    }
    action()
}

/* SCAN
warning: unreachable expression
  ==> nothing_lambda.cj:15:9:
   | 
14 |         throw Exception()
   |         ~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
15 |         println("unreachable lambda")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
