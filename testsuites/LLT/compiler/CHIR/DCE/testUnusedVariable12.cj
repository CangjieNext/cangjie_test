// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args

interface I {}

private struct A <: I {
    private static const a = 1
}

extend A {
    static func test() {
        const a = 1
    }
}

main() {
    return 0
}

/* SCAN
warning: unused variable:'a'
  ==> testUnusedVariable12.cj:13:26:
   | 
13 |     private static const a = 1
   |                          ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused function:'test'
  ==> testUnusedVariable12.cj:17:5:
   | 
17 |       static func test() {
   |  _____^
18 | |         const a = 1
19 | |     }
   | |_____^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'a'
  ==> testUnusedVariable12.cj:18:15:
   | 
18 |         const a = 1
   |               ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
