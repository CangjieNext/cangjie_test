// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args

class A {
    private func foo() {
        return 0
    }
}

private func foo1() {
    return 0
}

main() {
    return 0
}

/* SCAN
warning: unused function:'foo'
  ==> testUnusedFunction01.cj:11:5:
   | 
11 |       private func foo() {
   |  _____^
12 | |         return 0
13 | |     }
   | |_____^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused function:'foo1'
  ==> testUnusedFunction01.cj:16:1:
   | 
16 |   private func foo1() {
   |  _^
17 | |     return 0
18 | | }
   | |_^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
