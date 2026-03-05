// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

public func arrayShortcut01() {
    let arr = ["1", "2", "3", "4", "5"]
    let idx = 6
    if (idx >= 0 && idx < arr.size) {
        println("${arr.get(idx).getOrThrow()}")
    } 
}

main() {
    arrayShortcut01()
    0
}

/* SCAN
warning: unreachable block in 'if' expression
 ==> arrayShortcut02.cj:7:37:
  | 
7 |       if (idx >= 0 && idx < arr.size) {
  |  _____________________________________^
8 | |         println("${arr.get(idx).getOrThrow()}")
9 | |     } 
  | |_____^ unreachable block in 'if' expression
  | 
  # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
