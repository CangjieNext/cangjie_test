// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A <: Exception {}

var a = try {
    throw A()
    1
} catch (a: A) {
    print("success");
    2
}

main() {
    return a - 2
}

/* SCAN
warning: unreachable expression
  ==> testDCESeq03.cj:13:5:
   | 
12 |     throw A()
   |     ~~~~~~~~~ any code following this expression is unreachable
13 |     1
   |     ^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
