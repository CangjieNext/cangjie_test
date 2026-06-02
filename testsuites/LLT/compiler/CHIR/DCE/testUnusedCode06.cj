// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler --int-overflow=wrapping %cmp_opt %f -o %output 2>&1 | compare %f

func a() {
    var a = 1
    var b = 2
    var c = 3
    -a
    -b
    -c
    0
}

main() {
    a()
    return 0
}

/* SCAN
warning: unused result of the operator:'-'
  ==> testUnusedCode06.cj:13:5:
   | 
13 |     -a
   |     ^ unused result of the operator
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused result of the operator:'-'
  ==> testUnusedCode06.cj:14:5:
   | 
14 |     -b
   |     ^ unused result of the operator
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused result of the operator:'-'
  ==> testUnusedCode06.cj:15:5:
   | 
15 |     -c
   |     ^ unused result of the operator
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
