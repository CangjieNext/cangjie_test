// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC-2: %run %run_opt %output %run_args

func bar() {
    let a: Int64
    let b: Int64
    (a, b, _) = (1, 2, 3) // no warning
    (1, 2)
    return 2
}

main() {
    return bar()
}

/* SCAN
warning: unused variable:'a'
  ==> testUnusedCode20.cj:11:9:
   | 
11 |     let a: Int64
   |         ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'b'
  ==> testUnusedCode20.cj:12:9:
   | 
12 |     let b: Int64
   |         ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testUnusedCode20.cj:14:5:
   | 
14 |     (1, 2)
   |     ^^^^^^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
