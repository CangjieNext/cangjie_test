// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A <: Exception {}

main() {
    try {throw try {throw A();A()} finally {}}
    finally {}
    return 0
}

/* SCAN
warning: unreachable expression
  ==> testDCEThrow01.cj:12:31:
   | 
12 |     try {throw try {throw A();A()} finally {}}
   |                     ~~~~~~~~~ ^^^ unreachable expression
   |                     |
   |                     any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
