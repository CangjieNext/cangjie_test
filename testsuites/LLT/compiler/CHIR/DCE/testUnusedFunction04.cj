// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0:  %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f

main() {
    return 0
}

/* SCAN
warning: unused function:'main'
  ==> testUnusedFunction04.cj:9:1:
   | 
9  |   main() {
   |  _^
10 | |     return 0
11 | | }
   | |_^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
