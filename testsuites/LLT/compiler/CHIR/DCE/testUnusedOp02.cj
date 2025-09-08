// DEPENDENCE: testUnusedOp02.info
// EXEC-PIPE-0: %compiler --int-overflow=wrapping %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args %output 2>&1 | compare testUnusedOp02.info

func foo() {
    println("foo")
    return 1
}

func test1() {
    -foo()   // has warning
    0
}

main() {
    test1()
    return 0
}

/* SCAN
warning: unused result of the operator:'-'
  ==> testUnusedOp02.cj:11:5:
   | 
11 |     -foo()   // has warning
   |     ^ unused result of the operator
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
