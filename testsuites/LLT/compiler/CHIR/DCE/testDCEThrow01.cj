// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



class A <: Exception {}

main() {
    try {
        throw try {
            throw A()
            // EXPECT: chir_dce_unreachable_expression_hint
            A()
        } finally {}
    }
    finally {}
    // EXPECT: chir_dce_unreachable_expression_hint
    return 0
}

/* SCAN
warning: unreachable expression
  ==> testDCEThrow01.cj:18:13:
   | 
16 |             throw A()
   |             ~~~~~~~~~ any code following this expression is unreachable
17 |             // EXPECT: chir_dce_unreachable_expression_hint
18 |             A()
   |             ^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEThrow01.cj:23:5:
   | 
14 |       try {
   |  _____~
15 | |         throw try {
   | | ...
21 | |     finally {}
   | |______________~ any code following this expression is unreachable
22 |       // EXPECT: chir_dce_unreachable_expression_hint
23 |       return 0
   |       ^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
