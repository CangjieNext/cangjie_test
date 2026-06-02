// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

// global func
func foo(): Int64 {
    return 0
}

func bar() {
    let b = foo
    let c = b
    return 0
}

func bar1() {
    let d = foo
    return 0
}

main() {
    bar()
    bar1()
    let a = foo
    return 0
}

/* SCAN
warning: unused variable:'c'
  ==> testUnusedVariable06.cj:17:9:
   | 
17 |     let c = b
   |         ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'d'
  ==> testUnusedVariable06.cj:22:9:
   | 
22 |     let d = foo
   |         ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'a'
  ==> testUnusedVariable06.cj:29:9:
   | 
29 |     let a = foo
   |         ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
