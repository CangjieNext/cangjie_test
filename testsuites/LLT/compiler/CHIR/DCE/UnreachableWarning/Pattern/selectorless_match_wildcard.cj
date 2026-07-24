// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A wildcard in a selectorless match covers every following case.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let result = match {
        case _ => 0
        case true => 1
    }
    println(result)
}

/* SCAN
warning: unreachable pattern
  ==> selectorless_match_wildcard.cj:13:14:
   | 
13 |         case true => 1
   |              ^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
