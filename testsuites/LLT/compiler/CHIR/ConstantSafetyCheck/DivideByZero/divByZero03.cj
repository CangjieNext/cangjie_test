// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

const bad: Int64 = 1 / 0

main(): Int64 {
    println(bad)
    return 0
}

/* SCAN
error: divide by zero
  ==> divByZero03.cj:10:20:
   | 
10 | const bad: Int64 = 1 / 0
   |                    ^^^^^ attempt to divide by zero
   | 

1 error generated, 1 error printed.
*/
