// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %noColor --warn-off unused %f 2>&1 | compare %f

func test() {
    return 0
}

main() {
    return 1
        + 1 - 2
    return test()
}

/* SCAN
warning: possibly confusing line terminator
  ==> suppress_group.cj:14:13:
   | 
14 |       return 1
   |              ~^ 
   |  ____________|
15 | |         + 1 - 2
   | |_________~ possibly confusing line terminator between '1' and '+'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff parser`

1 warning generated, 1 warning printed.
*/
