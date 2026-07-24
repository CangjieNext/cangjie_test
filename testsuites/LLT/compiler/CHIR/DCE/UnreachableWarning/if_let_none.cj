// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Cover an if-let pattern that cannot match a known None value.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main() {
    if (let Some(value) <- Option<Int64>.None) {
        println(value)
    }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> if_let_none.cj:12:13:
   | 
12 |     if (let Some(value) <- Option<Int64>.None) {
   |             ^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
