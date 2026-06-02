// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %noColor --warn-off all --warn-on unused %f 2>&1 | compare %f

private func test() {
    return 0
}

main() {
    return 1
        + 1 - 2
    return test()
}

/* SCAN
warning: unused function:'test'
  ==> warn_group.cj:9:1:
   | 
9  |   private func test() {
   |  _^
10 | |     return 0
11 | | }
   | |_^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> warn_group.cj:16:5:
   | 
14 |       return 1
   |  _____~
15 | |         + 1 - 2
   | |_______________~ any code following this expression is unreachable
16 |       return test()
   |       ^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
