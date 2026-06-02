// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %noColor --warn-off all -Won all %f 2>&1 | compare %f

private func test() {
    return 0
}

main() {
    return 1
        + 1 - 2
    return test()
}

/* SCAN
warning: possibly confusing line terminator
  ==> warn_all_short.cj:14:13:
   | 
14 |       return 1
   |              ~^ 
   |  ____________|
15 | |         + 1 - 2
   | |_________~ possibly confusing line terminator between '1' and '+'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff parser`

warning: unused function:'test'
  ==> warn_all_short.cj:9:1:
   | 
9  |   private func test() {
   |  _^
10 | |     return 0
11 | | }
   | |_^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> warn_all_short.cj:16:5:
   | 
14 |       return 1
   |  _____~
15 | |         + 1 - 2
   | |_______________~ any code following this expression is unreachable
16 |       return test()
   |       ^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
